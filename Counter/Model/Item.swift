//
//  Item.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 31/12/2020.
//

import Foundation
import RealmSwift

struct Item: Identifiable {
    var id = UUID().uuidString
    var title: String
    var value: Int
}

class Item1: Object {
//    @objc dynamic let id = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var value: Int = 0
}
