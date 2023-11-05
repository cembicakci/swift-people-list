//
//  UsersResponse.swift
//  List
//
//  Created by Cem Bıçakcı on 4.11.2023.
//

import Foundation

// MARK: - UsersResponse
struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
    

}
