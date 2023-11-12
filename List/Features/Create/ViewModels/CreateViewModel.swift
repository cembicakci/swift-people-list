//
//  CreateViewModel.swift
//  List
//
//  Created by Cem Bıçakcı on 6.11.2023.
//

import Foundation

final class CreateViewModel: ObservableObject {
    
    @Published var person = NewPerson()
    @Published private(set) var state: SubmissionState?
    
    @Published private(set) var error: FormError?
    @Published var hasError = false
    
    private let validator = CreateValidator()
    
    func create() {
        
        do {
            try validator.validate(person)
            
            state = .submitting
            
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            let data = try? encoder.encode(person)
            NetworkingManager.shared.request(.create(submissionData: data)) { [weak self] res in
                
                DispatchQueue.main.async {
                    switch res {
                    case .success:
                        self?.state = .succesful
                    case .failure(let err):
                        self?.state = .unsuccesful
                        self?.hasError = true
                        
                        if let networkingError = err as? NetworkingManager.NetworkingError {
                            self?.error = .networking(error: networkingError)
                        }
                    }
                }
            }
            
        } catch {
            self.hasError = true
            if let validateError = error as? CreateValidator.CreateValidatorError {
                self.error = .networking(error: validateError)
            }
            print(error)
        }
    
    }
}


extension CreateViewModel {
    enum SubmissionState {
        case unsuccesful
        case succesful
        case submitting
    }
}


extension CreateViewModel {
    enum FormError: LocalizedError {
        case networking(error: LocalizedError)
        case validation(error: LocalizedError)
    }
}


extension CreateViewModel.FormError {
    var errorDescription: String? {
        switch self {
        case .networking(let error),
             .validation(let error):
            return error.errorDescription
        }
    }
}
