//
//  CreateValidator.swift
//  List
//
//  Created by Cem Bıçakcı on 12.11.2023.
//

import Foundation

struct CreateValidator {
    func validate(_ person: NewPerson) throws {
        if person.firstName.isEmpty {
            throw CreateValidatorError.invalidFirstName
        }
        
        if person.lastName.isEmpty {
            throw CreateValidatorError.invalidLastName
        }
        
        if person.job.isEmpty {
            throw CreateValidatorError.invalidJob
        }
    }
        
}

extension CreateValidator {
    enum CreateValidatorError: LocalizedError {
        case invalidFirstName
        case invalidLastName
        case invalidJob
    }
}

extension CreateValidator.CreateValidatorError {
    var errorDescription: String? {
        switch self {
        case .invalidFirstName:
            return "First name can not be empty"
        case .invalidLastName:
            return "Last name can not be empty"
        case .invalidJob:
            return "Job can not be empty"
        }
    }
}
