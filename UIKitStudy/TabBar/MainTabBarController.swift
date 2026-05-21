//
//  SceneDelegate.swift
//  UIKitStudy
//
//  Created by Cauê Carneiro on 14/05/26.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let updates = makePlaceholderNav(title: "Updates", icon: "bell.fill")
        let calls = makeCallsNav()
        let communities = makePlaceholderNav(title: "Communities", icon: "person.3.fill")
        let chats = makeChatsNav()
        let settings = makePlaceholderNav(title: "Settings", icon: "gear")

        viewControllers = [updates, calls, communities, chats, settings]
    }

    private func makeCallsNav() -> UINavigationController {
        let vc = CallsViewController()
        vc.tabBarItem = UITabBarItem(title: "Calls", image: UIImage(systemName: "phone.fill"), tag: 0)
        return UINavigationController(rootViewController: vc)
    }

    private func makeChatsNav() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContactsList")
        vc.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message.fill"), tag: 1)
        return UINavigationController(rootViewController: vc)
    }

    private func makePlaceholderNav(title: String, icon: String) -> UINavigationController {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: icon), tag: 0)
        return UINavigationController(rootViewController: vc)
    }
}
