//
//  ItemModel.swift
//  Todolist
//
//  Created by Tarun Kumar on 04/06/25.
//

import Foundation

struct ItemModel: Identifiable {
    let id:String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString,
        title: String,
         isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateCompletionState() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
