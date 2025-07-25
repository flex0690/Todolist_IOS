//
//  ListViewModel.swift
//  Todolist
//
//  Created by Tarun Kumar on 08/07/25.
//

import Foundation

class ListViewModel: ObservableObject {

    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    let itemsKey = "items_list"

    init() {
        getItems()
    }

    func getItems() {
//       let newItem =  [
//           ItemModel(title: "first", isCompleted: true),
//           ItemModel(title: "second", isCompleted: false),
//           ItemModel(title: "third", isCompleted: false),
//       ]
//        items.append(contentsOf: newItem)

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.items = savedItem
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)

        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
       if let index = items.firstIndex(where: { currentItem in
            currentItem.id == item.id
       }) {
           items[index] = item.updateCompletionState()
       }
    }

    private func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
