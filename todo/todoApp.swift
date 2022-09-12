//
//  todoApp.swift
//  todo
//
//  Created by Aman Negi on 11/09/22.
//

import SwiftUI

@main
struct todoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                NoListView()
            }.environmentObject(listViewModel)
        }
    }
}
