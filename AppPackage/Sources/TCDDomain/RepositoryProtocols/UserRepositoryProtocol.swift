//
//  UserRepositoryProtocol.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import Foundation

public protocol UserRepositoryProtocol {
    func fetchUser() async throws -> UserResponse
}
