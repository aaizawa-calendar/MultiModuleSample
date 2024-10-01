//
//  ViewModel.swift
//  MultiModuleSample
//
//  Created by aizawa on 2024/10/01.
//

import Foundation
import SharedModels
import TCDDomain
import Combine

final class ViewModel: ViewModelObject {
    private let userUseCase: UserUseCaseProtocol
    
    
    struct Input {
        let buttonTapped = PassthroughSubject<Void, Never>()
    }
    final class Binding: BindingObject {
    }
    final class Output: OutputObject {
        @Published fileprivate(set) var user: UserModel?
    }
    
    let input: Input
    @BindableObject private(set) var binding: Binding
    let output: Output
    private var cancellables = Set<AnyCancellable>()
    
    init(userUseCase: UserUseCaseProtocol) {
        self.userUseCase = userUseCase
        
        self.input = Input()
        self.binding = Binding()
        self.output = Output()
        setup()
    }
    
    private func setup() {
        input.buttonTapped
            .sink { [weak self] in
                self?.fetchUser()
            }.store(in: &cancellables)
    }
    
    private func fetchUser() {
        Task {
            do {
                output.user = try await userUseCase.fetchUser()
            } catch {
                // TODO: エラー処理
            }
        }
    }
}
