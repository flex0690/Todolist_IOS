//
//  TodolistApp.swift
//  Todolist
//
//  Created by Tarun Kumar on 14/05/25.
//

import SwiftUI

@main
struct TodolistApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
