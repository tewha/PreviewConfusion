//
//  ContentView.swift
//  PreviewConfusion
//
//  Created by Steven Fisher on 2024-09-11.
//

import SwiftUI

struct Message: Identifiable {
    var id: UUID
    var title: String
    let text: String

    init(_ title: String, text: String) {
        self.id = UUID()
        self.title = title
        self.text = text
    }
}

struct ContentView: View {
    @State var presenting: Bool = false

    let messages = [
        Message("Short", text: "Is this thing even on?"),
        Message("Medium", text: "Can you hear me? I can’t hear you. Give me a minute to set up my headphones."),
        Message("Long", text: "Can you hear me? I can’t hear you. Give me a minute to set up my headphones. I still can't hear you.")
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text("Hold down on text to show context menu.")
            ForEach(messages) { message in
                Button {
                    presenting = true
                } label: {
                    Text(message.title)
                }
                .contextMenu {
                    Button {
                        // nothing to do
                    } label: {
                        Label("View Profile", systemImage: "person.circle")
                    }
                } preview: {
                    PreviewView("Person1", message: message.text)
                }
            }
        }
        .padding()
        .alert("Hold down instead of tapping.", isPresented: $presenting) {
            Button("OK", role: .cancel) {
                // alert closes automatically
            }
        }
    }
}

#Preview {
    ContentView()
}
