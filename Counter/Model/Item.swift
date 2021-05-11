//
//  Item.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 31/12/2020.
//

import RealmSwift

class Item: Object, Identifiable {
    @objc dynamic let id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var value: Int = 0
}
