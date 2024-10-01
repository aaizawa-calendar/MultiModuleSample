//
//  UserUseCase.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import Foundation
import SharedModels

public protocol UserUseCaseProtocol {
    func fetchUser() async throws -> UserModel
}

public final class UserUseCase: UserUseCaseProtocol {
    private let userRepository: UserRepositoryProtocol

    public init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    public func fetchUser() async throws -> UserModel {
        do {
            let response = try await userRepository.fetchUser()
            return UserModel(response: response)
        } catch {
            // エラー処理
            throw error
        }
    }
}
