//
//  UserModel.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import TCDCore
import SharedModels

extension UserModel {
    init(response: UserResponse) {
        self.init(
            name: response.name,
            birthday: response.birthday.toDate(format: "yyyy/MM/dd")
        )
    }
}
