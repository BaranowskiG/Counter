//
//  Assets.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 03/01/2021.
//

import SwiftUI

struct Assets {
    static let mainColor = Color("main")
    static let secondaryColor = Color("secondary")
    
    static let newUserTips = [
        Tip(title: "Create", description: "Use plus button in top right corner to add new counter.", imageName: "plus"),
        Tip(title: "Increse", description: "Tap on created couter to increse value by one.", imageName: "hand.tap.fill"),
        Tip(title: "Delete", description: "Long press on couter to delete it.", imageName: "trash.fill")
    ]
    
    static func setBasicFont(size: CGFloat) -> Font {
        return Font.system(size: size, weight: .semibold, design: .rounded)
    }
}
