//
//  UserDetailResponse.swift
//  List
//
//  Created by Cem Bıçakcı on 4.11.2023.
//

import Foundation

// MARK: - Welcome
struct UserDetailResponse: Codable {
    let data: User?
    let support: Support?
}

