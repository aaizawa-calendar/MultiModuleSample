//
//  ViewController.swift
//  MultiModuleSample
//
//  Created by aizawa on 2024/10/01.
//

import UIKit
import Combine
import TCDCore

class ViewController: UIViewController {
    private var viewModel: ViewModel!
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()

        // ラベル
        let label = UILabel()
        label.text = "ラベル"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        // ボタン
        let button = UIButton(type: .roundedRect)
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("タップ", for: .normal)
        button.addAction(.init { [weak self] _ in
            // ボタンタップイベントをViewModelに伝える
            self?.viewModel.input.buttonTapped.send()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        // レイアウトはてきとう
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: label.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        // ラベルに名前を表示する
        viewModel.output.$user.sink { user in
            if let user = user {
                label.text = "\(user.name) \(user.birthday!.toString(format: "yyyy年MM月dd日"))"
            }
        }.store(in: &cancellables)
    }
}

