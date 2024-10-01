//
//  UserResponse.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import Foundation

public struct UserResponse: Decodable {
    public let name: String
    public let birthday: String // yyyy/MM/dd
    
    // 実際はJSONレスポンスを扱うのにDecodableに準拠してれば良いので不要。
    public init(name: String, birthday: String) {
        self.name = name
        self.birthday = birthday
    }
}
