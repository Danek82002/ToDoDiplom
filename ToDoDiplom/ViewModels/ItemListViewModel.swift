//
//  ItemListViewModel.swift
//  ToDoDiplom
//
//  Created by Student on 29.04.2022.
//

import Foundation

//class ItemListViewModel: ObservableObject, Identifiable {
//
//    @Published var checkListTitle = ""
////    @Published var oldItems =  ""
//    let itemsKey: String = "items_list"
//
//    init() {
//        getItems()
//    }
//
//    let id = UUID()
//
//    @Published var items = [ItemModel]() {
//        didSet {
//// this saveItems() gonna work for all of functions
//            saveItems()
//        }
//    }
//
//    func getItems() {
//        guard
//            let data = UserDefaults.standard.data(forKey: itemsKey),
//            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
//        else {return}
//
//        self.items = savedItems
//    }
//
//
//    func addElement(newName: String) {
//        items.append(ItemModel(text: newName))
//    }
//
//    func remove(atOffsets indices: IndexSet) {
//        items.remove(atOffsets: indices)
//    }
//
//    func move(indices: IndexSet, newOffset: Int) {
//        items.move(fromOffsets: indices, toOffset: newOffset)
//    }
//
//    func reset() {
////        oldItems = items
//        self.items = items.map {
//            var copy = $0
//            copy.isChecked = false
//            return copy
//        }
//    }
//
////    func undo() {
////        self.items  = oldItems.map {
////            var new = $0
////            new.isChecked = true
////            return new
////        }
////    }
//
////    for saing the data
//    func saveItems() {
//        if let encodedData = try? JSONEncoder().encode(items) {
//            UserDefaults.standard.set(encodedData, forKey: itemsKey)
//        }
//    }
//}
