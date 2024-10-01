//
//  ViewModelProtocol.swift
//  MultiModuleSample
//
//  Created by aizawa on 2024/10/01.
//

import Combine
import SwiftUI

/// ViewModelが準拠するプロトコル
protocol ViewModelProtocol: ObservableObject {
    associatedtype Input
    associatedtype Output: OutputObject

    var output: Output { get }
}

protocol OutputObject: ObservableObject {
}

/// ViewModelが準拠するプロトコル
@MainActor
@available(*, deprecated, renamed: "ViewModelObject")
protocol UIViewModelProtocol: ViewModelProtocol {
    var output: Output { get }

    func setup(input: Input)
}

/// ViewModelが準拠するプロトコル
@MainActor
protocol ViewModelObject: ViewModelProtocol {
    associatedtype Binding: BindingObject

    var input: Input { get }
    var binding: Binding { get }
    var output: Output { get }
}

extension ViewModelObject where Binding.ObjectWillChangePublisher == ObservableObjectPublisher, Output.ObjectWillChangePublisher == ObservableObjectPublisher {
    var objectWillChange: AnyPublisher<Void, Never> {
        Publishers.Merge(binding.objectWillChange, output.objectWillChange).eraseToAnyPublisher()
    }
}

protocol BindingObject: ObservableObject {
}

@propertyWrapper struct BindableObject<T: BindingObject> {
    @dynamicMemberLookup struct Wrapper {
        fileprivate let binding: T
        subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<T, Value>) -> Binding<Value> {
            .init(
                get: { self.binding[keyPath: keyPath] },
                set: { self.binding[keyPath: keyPath] = $0 }
            )
        }
    }

    var wrappedValue: T

    var projectedValue: Wrapper {
        Wrapper(binding: wrappedValue)
    }
}
