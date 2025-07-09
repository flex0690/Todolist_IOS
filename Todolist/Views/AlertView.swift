//
//  AlertView.swift
//  Todolist
//
//  Created by Tarun Kumar on 08/07/25.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        alert("Title", isPresented: $isShowAlert) {
                    Button("Presse Me") {
                        // action when button pressed
                    }
                } message: {
                    Text("Message")
        }

    }
}

#Preview {
    AlertView()
}
