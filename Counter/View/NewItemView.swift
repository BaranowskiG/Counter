//
//  NewItemView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 02/01/2021.
//

import SwiftUI
import RealmSwift

struct NewItemView: View {
    
    @State var newItemName: String = ""
    @Binding var items: [Item]
    @Binding var viewState: Bool
    
    var body: some View {
        VStack {
            Text("Create new counter")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            TextField("Title", text: $newItemName, onCommit: addNewItem)
                .padding()
                .background(Color.black)
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 20).stroke(Color("main"), lineWidth: 4).brightness(0.1)
                )
                .padding(40)
        }
    }
    
    func addNewItem() {
        items.append(Item(title: newItemName, value: 0))
        
        let newItem = Item1()
        newItem.title = newItemName
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(newItem)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        newItemName = ""
        withAnimation {
            viewState = false
        }
    }
}

