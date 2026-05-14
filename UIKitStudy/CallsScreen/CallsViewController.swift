//
//  CallsViewController.swift
//  UIKitStudy
//
//  Created by Cauê Carneiro on 14/05/26.
//

import UIKit

// Tela feita com UIKit + ViewCode
class CallsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Calls"
    }
}
