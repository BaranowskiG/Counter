//
//  ItemViewModel.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 03/01/2021.
//

import SwiftUI
import RealmSwift

class ItemViewModel: ObservableObject {
    
    @Published var itemList : Results<Item>?
    let realm = try! Realm()
    
    func createItem(with name: String) {
        let item = Item()
        item.title = name
        try! realm.write {
            realm.add(item)
        }
    }
    
    func getItem() {
        try! realm.write {
            itemList = realm.objects(Item.self)
        }
    }
    
    func deleteItem(title: String) {
        let item = realm.objects(Item.self).filter("title == \"\(title)\"")
        try! realm.write({
            realm.delete(item)
        })
        print(item)
        
    }
    
    func updateItem(title: String) {
        let item = realm.objects(Item.self).filter("title == \"\(title)\"")
        try! realm.write({
            item.first?.value += 1
        })
    }
    
}
