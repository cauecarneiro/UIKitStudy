//
//  ChatsViewController.swift
//  UIKitStudy
//
//  Created by Cauê Carneiro on 14/05/26.
//

import UIKit
import SwiftUI

// Ciclo de vida UIKit hospedando tela SwiftUI
//Jotape

class ChatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chats"
        setupHostingController()
    }

    private func setupHostingController() {
        let chatsView = ChatsView {
            self.navigateToConversation()
        }
        let hosting = UIHostingController(rootView: chatsView)
        addChild(hosting)
        view.addSubview(hosting.view)
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hosting.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hosting.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        hosting.didMove(toParent: self)
    }

    private func navigateToConversation() {
        let storyboard = UIStoryboard(name: "Conversation", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
