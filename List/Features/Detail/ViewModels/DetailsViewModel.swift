//
//  DetailsViewModel.swift
//  List
//
//  Created by Cem Bıçakcı on 6.11.2023.
//

import Foundation

final class DetailsViewModel: ObservableObject {
    
    @Published private(set) var userInfo: UserDetailResponse?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published private(set) var isLoading = false
    @Published var hasError = false
    
    func fetchDetails(for id: Int) {
        isLoading = true
        NetworkingManager.shared.request(.detail(id: id), type: UserDetailResponse.self) { [weak self] res in
            
            defer { self?.isLoading = false }
            
            DispatchQueue.main.async {
                switch res {
                case .success(let response):
                    self?.userInfo = response
                case .failure(let error):
                    self?.hasError = true
                    self?.error = error as? NetworkingManager.NetworkingError
                }
                
            }
        
        }
    }
    
}
