//
//  PreviewView.swift
//  Sayote
//
//  Created by Steven Fisher on 2024-09-11.
//

import SwiftUI

struct PreviewView: View {
    let person: String
    let message: String

    init(_ person: String, message: String) {
        self.person = person
        self.message = message
    }

    var body: some View {
        HStack(spacing: 10) {
            Image(person)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 120, maxWidth: 120)
            VStack {
                HStack {
                    Text("“\(message)”")
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(" – \(person)").italic() // TODO: lookup name
                }
            }
        }
        .padding(5)
        .background(Color(person))
    }
}
