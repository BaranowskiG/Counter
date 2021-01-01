//
//  Item.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 31/12/2020.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var title: String
    var value: Int
}
