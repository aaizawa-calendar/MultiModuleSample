//
//  UserRepository.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import TCDDomain

public final class UserRepository: UserRepositoryProtocol {
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func fetchUser() async throws -> UserResponse {
        // リクエストを再現（本当は型パラメータで指定してキャスト不要）
        try await apiClient.request() as! UserResponse
    }
}
