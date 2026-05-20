//
//  ConversationViewController.swift
//  UIKitStudy
//
//  Created by Cauê Carneiro on 14/05/26.
//

import UIKit
import SwiftUI

// Ciclo de vida UIKit hospedando tela SwiftUI (ConversationView)
class ConversationViewController: UIViewController {

    var contactName: String = "Emmett \"Doc\" Br…"
    var contactImageName: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        hidesBottomBarWhenPushed = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Conversa"
        setupHostingController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupHostingController() {
        let conversationView = ConversationView(
            contactName: contactName,
            contactImageName: contactImageName,
            messages: ChatMockData.conversation(for: contactName),
            onBack: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        )
        let hosting = UIHostingController(rootView: conversationView)
        addChild(hosting)
        view.addSubview(hosting.view)
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hosting.view.topAnchor.constraint(equalTo: view.topAnchor),
            hosting.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hosting.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hosting.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hosting.didMove(toParent: self)
    }
}
