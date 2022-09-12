//
//  ListViewModel.swift
//  todo
//
//  Created by Aman Negi on 11/09/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            // #2 - As soon as the new item is pushed in the list, didSet method is called
            // and @Published will change the UI
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        // #3 - This will be automatically called which will fetch th updated item list
        fetchItems()
    }
    
    func addItem(Title: String) {
        let newItem = ItemModel(Title: Title, IsCompleted: false)
        items.append(newItem) // #1 - Pushes the new item in the items list
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompleted()
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveItems()  {
        if let encodedItems = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedItems, forKey: itemsKey)
        }
    }
    
    func fetchItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
            return
        }
        
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return
        }
        
        self.items = savedItems
    }
    
}
