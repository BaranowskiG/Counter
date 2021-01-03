//
//  DarkenedBackgroundView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 02/01/2021.
//

import SwiftUI

struct DarkenedViewBackground: View {
    
    @Binding var visible: Bool
    
    var body: some View {
        Color.black.opacity(visible ? 0.9 : 0.0)
            .onTapGesture {
                withAnimation {
                    visible = false
                }
            }
            .accentColor(Assets.mainColor)
    }
}
