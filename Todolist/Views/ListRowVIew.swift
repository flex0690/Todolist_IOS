//
//  ListRowVIew.swift
//  Todolist
//
//  Created by Tarun Kumar on 03/06/25.
//

import SwiftUI

struct ListRowVIew: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }
        .padding(.vertical, 8)
    }
}

//struct ListRowVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ListRowVIew(item: ItemModel(title: "second", isCompleted: true))
//            ListRowVIew(item: ItemModel(title: "thi", isCompleted: true))
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}


#Preview(traits: .fixedLayout(width: 100, height: 100)) {
    Group {
        ListRowVIew(item: ItemModel(title: "first", isCompleted: true))
        ListRowVIew(item: ItemModel(title: "first", isCompleted: false))
    }
}
