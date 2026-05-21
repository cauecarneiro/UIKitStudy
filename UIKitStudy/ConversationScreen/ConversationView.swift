//
//  ConversationView.swift
//  UIKitStudy
//
//  Created by Joao pedro Leonel on 20/05/26.
//

import SwiftUI

// Tela feita com SwiftUI + ciclo de vida UIKit (hospedada por ConversationViewController)

struct ConversationView: View {
    let contactName: String
    let contactImageName: String?
    let messages: [ChatMessage]

    var onBack: () -> Void = {}

    var body: some View {
        VStack(spacing: 0) {
            ConversationHeader(
                contactName: contactName,
                contactImageName: contactImageName,
                onBack: onBack
            )

            messagesScroll
                .background(WhatsAppBackground.color)

            InputBar()
        }
        .background(WhatsAppBackground.color)
        .ignoresSafeArea(.container, edges: .bottom)
    }

    private var messagesScroll: some View {
        ScrollView {
            LazyVStack(spacing: 6) {
                DateSeparator(text: "Today")
                    .padding(.vertical, 8)

                ForEach(messages) { message in
                    MessageBubble(message: message)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Header

private struct ConversationHeader: View {
    let contactName: String
    let contactImageName: String?
    let onBack: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            Button(action: onBack) {
                HStack(spacing: 2) {
                    Image(systemName: "chevron.left")
                        .font(.title3.weight(.semibold))
                    Text("1")
                        .font(.subheadline)
                }
                .foregroundStyle(.tint)
            }
            .accessibilityLabel("Voltar")

            avatar

            VStack(alignment: .leading, spacing: 0) {
                Text(contactName)
                    .font(.headline)
                    .lineLimit(1)
                Text("tap here for contact info")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "video")
                .font(.title3)
                .foregroundStyle(.tint)
            Image(systemName: "phone")
                .font(.title3)
                .foregroundStyle(.tint)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.regularMaterial)
        .overlay(alignment: .bottom) {
            Divider()
        }
    }

    @ViewBuilder
    private var avatar: some View {
        Group {
            if let name = contactImageName, UIImage(named: name) != nil {
                Image(name)
                    .resizable()
                    .scaledToFill()
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundStyle(.secondary)
            }
        }
        .frame(width: 36, height: 36)
        .clipShape(Circle())
    }
}

// MARK: - Date separator

private struct DateSeparator: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption.weight(.medium))
            .foregroundStyle(.secondary)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                Capsule().fill(Color(white: 1).opacity(0.85))
            )
    }
}

// MARK: - Bubble

private struct MessageBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.sender == .me { Spacer(minLength: 40) }

            BubbleContent(message: message)
                .frame(maxWidth: .infinity, alignment: alignment)

            if message.sender == .them { Spacer(minLength: 40) }
        }
    }

    private var alignment: Alignment {
        message.sender == .me ? .trailing : .leading
    }
}

private struct BubbleContent: View {
    let message: ChatMessage

    var body: some View {
        // ViewThatFits lets the time sit inline when the message is short,
        // and wrap below when it would push the text into multiple lines.
        ViewThatFits(in: .horizontal) {
            inlineLayout
            stackedLayout
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(bubbleColor)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .fixedSize(horizontal: false, vertical: true)
    }

    private var inlineLayout: some View {
        HStack(alignment: .bottom, spacing: 6) {
            Text(message.text)
                .font(.body)
                .foregroundStyle(.primary)
            metadata
        }
    }

    private var stackedLayout: some View {
        VStack(alignment: .trailing, spacing: 2) {
            Text(message.text)
                .font(.body)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            metadata
        }
    }

    private var metadata: some View {
        HStack(spacing: 2) {
            Text(message.time)
                .font(.caption2)
                .foregroundStyle(.secondary)
            if message.sender == .me {
                Image(systemName: "checkmark")
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(Color(red: 0.30, green: 0.60, blue: 0.95))
                    .padding(.leading, 1)
                Image(systemName: "checkmark")
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(Color(red: 0.30, green: 0.60, blue: 0.95))
                    .padding(.leading, -6)
            }
        }
    }

    private var bubbleColor: Color {
        message.sender == .me
            ? Color(red: 0.85, green: 0.99, blue: 0.83)
            : Color.white
    }
}

// MARK: - Input bar

private struct InputBar: View {
    @State private var draft: String = ""

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "plus")
                .font(.title3)
                .foregroundStyle(.secondary)
                .frame(width: 32, height: 32)

            HStack(spacing: 6) {
                TextField("", text: $draft)
                    .disabled(true)
                    .textFieldStyle(.plain)
                    .frame(minHeight: 28)
                Image(systemName: "face.smiling")
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                Capsule().fill(Color(.systemBackground))
            )
            .overlay(
                Capsule().stroke(Color(.separator), lineWidth: 0.5)
            )

            Image(systemName: "camera")
                .font(.title3)
                .foregroundStyle(.secondary)
            Image(systemName: "mic")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 10)
        .padding(.top, 8)
        .padding(.bottom, 24)
        .background(.regularMaterial)
        .overlay(alignment: .top) { Divider() }
        .disabled(true)
    }
}

// MARK: - Background

private enum WhatsAppBackground {
    static let color = Color(red: 0.91, green: 0.89, blue: 0.82)
}

#Preview {
    ConversationView(
        contactName: "Emmett \"Doc\" Br…",
        contactImageName: nil,
        messages: ChatMockData.docBrownConversation
    )
}
