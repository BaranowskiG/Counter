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
    
    func createItem(with name: String) {
        let item = Item()
        item.title = name
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(item)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getItem() {
        do {
            let realm = try Realm()
            try realm.write {
              itemList = realm.objects(Item.self)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteItem(title: String) {
        
        if itemList == nil { return }
        
        for item in itemList! {
            if item.title == title {
                print("Item title: ", item.title)
                print("to delete title: ", title)
                do {
                    let realm = try Realm()
                    try realm.write({
                        realm.delete(item)
                    })
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

        getItem()
    }
//
//    func updateItem(id: String) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.add(item)
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//
    
    
}
