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
        Message("Long", text: "Can you hear me? I can’t hear you. Give me a minute to set up my headphones. I still can't hear you."),
        Message("Huge", text: "Can you hear me? I can’t hear you. Give me a minute to set up my headphones. I still can't hear you. Let me try my other headphones and call you again on my iPhone")
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

                // Relevant code here (I think).
                .contextMenu {
                    Button {
                        // nothing to do
                    } label: {
                        Label("View Profile", systemImage: "person.circle")
                    }
                } preview: {
                    HStack(spacing: 10) {
                        Image("Person1")
                            .resizable()
                            .scaledToFit()
                            .frame(idealWidth: 100, maxWidth: 100)
                        VStack(alignment: .leading) {
                            Text("“\(message.text)”")
                                .frame(idealWidth: 250)
                            Text(" – Person1").italic()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .padding(10)
                    .background(Color("Person1"))
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
