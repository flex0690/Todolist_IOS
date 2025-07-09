//
//  AddView.swift
//  Todolist
//
//  Created by Tarun Kumar on 03/06/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFeildText:String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""

    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here... 🖊️", text: $textFeildText, axis: .vertical)
                    .lineLimit(5)
                    .padding(.horizontal)
                    .frame(height: 46)
                    .background(.gray)
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                })

            }
            .padding(20)
        }
        .navigationTitle("Add Note...")
        .alert(isPresented: $showAlert) {
            getAlert(alertText: alertTitle)
        }
    }
    func saveButtonPressed() {
        if textFeildSize() {
            listViewModel.addItem(title: textFeildText)
            presentationMode.wrappedValue.dismiss()
        }
    }

    func textFeildSize() -> Bool {
        if textFeildText.count < 3 {
            alertTitle = "Please Enter More the 3 Characheters"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert(alertText: String) -> Alert {
        Alert(title: Text(alertText))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
