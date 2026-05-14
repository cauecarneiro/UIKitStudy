//
//  ChatsView.swift
//  UIKitStudy
//
//  Created by Cauê Carneiro on 14/05/26.
//

import SwiftUI

// Tela feita com SwiftUI + ciclo de vida UIKit
// Jotape

struct ChatsView: View {
    var onConversationTap: () -> Void

    var body: some View {
        Button("Conversa") {
            onConversationTap()
        }
        .font(.headline)
    }
}
