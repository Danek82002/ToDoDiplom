//
//  ListView.swift
//  ToDoDiplom
//
//  Created by Student on 29.04.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("CheckList 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("➕", destination: AddView())
            )
        
       Spacer()
            HStack {
                Spacer()
            Button("Send Notification") {
                      
                    }
                Spacer()
                Button("Disable Notification") {
                    
                }
                Spacer()
            }
    }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
