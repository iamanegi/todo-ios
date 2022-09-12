//
//  ItemModel.swift
//  todo
//
//  Created by Aman Negi on 11/09/22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(Id: String = UUID().uuidString, Title: String, IsCompleted: Bool) {
        // UUID().uuidString is used to properly follow the Identifiable protocol
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(Id: id, Title: title, IsCompleted: !isCompleted)
    }
    
}
