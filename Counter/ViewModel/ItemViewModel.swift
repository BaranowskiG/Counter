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
                print("GET: ",itemList![0].title ?? "")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    func deleteItem(id: String) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.delete()
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
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
