//
//  UserModel.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import Foundation

public struct UserModel {
    public let name: String
    public let birthday: Date? // 文字列でなく日付として持ちたい

    public init(name: String, birthday: Date?) {
        self.name = name
        self.birthday = birthday
    }
}
