//
//  Assets.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 03/01/2021.
//

import SwiftUI

struct Assets {
    static let mainColor = Color("main")
    
    static func setBasicFont(size: CGFloat) -> Font {
        return Font.system(size: size, weight: .semibold, design: .rounded)
    }
}
