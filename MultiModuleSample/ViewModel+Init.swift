//
//  ViewModel+Init.swift
//  MultiModuleSample
//
//  Created by aizawa on 2024/10/01.
//

import Foundation
import TCDCore
import TCDDomain
import TCDData

extension ViewModel {
    // 依存関係
    convenience init() {
        let userRepository = UserRepository(apiClient: APIClientMock())
        let userUseCase = UserUseCase(userRepository: userRepository)
        
        self.init(userUseCase: userUseCase)
    }
}
