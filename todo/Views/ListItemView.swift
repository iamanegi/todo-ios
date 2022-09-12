//
//  ListItemView.swift
//  todo
//
//  Created by Aman Negi on 12/09/22.
//

import SwiftUI

struct ListItemView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.headline)
            .padding(.vertical, 8)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var item1 = ItemModel(Title: "Dummy task", IsCompleted: false)
    static var item2 = ItemModel(Title: "Dummy task", IsCompleted: true)
    static var previews: some View {
        Group {
            ListItemView(item: item1)
            ListItemView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
