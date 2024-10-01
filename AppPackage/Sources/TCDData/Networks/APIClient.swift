//
//  APIClient.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import TCDDomain

public protocol APIClientProtocol {
    func request() async throws -> Decodable
}

public final class APIClientMock: APIClientProtocol {
    public init() {}
    
    // 雑にリクエストを再現してユーザレスポンスを返す
    public func request() async throws -> Decodable {
        // 3秒待つ
        try await Task.sleep(nanoseconds: UInt64(3 * 1_000_000_000))
        // JSONのレスポンスでユーザ情報を受け取った想定
        // {
        //   "name":  "東京太郎",
        //   "birthday":  "2001/10/21"
        // }
        return UserResponse(name: "東京太郎", birthday: "2001/10/21")
    }
}
