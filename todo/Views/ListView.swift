//
//  ListView.swift
//  todo
//
//  Created by Aman Negi on 12/09/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    // no need to pass id bcoz we properly passed it
                    // using the UUID initialization
                    ForEach(listViewModel.items) { item in
                        ListItemView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }.navigationTitle("Todo List ✏️")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddTaskView())
            )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
    }
}
