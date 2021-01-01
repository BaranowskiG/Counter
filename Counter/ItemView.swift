//
//  ItemView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 31/12/2020.
//

import SwiftUI

struct ItemView: View {
    
    @State var title: String
    @State var value: Int
    
    let size = UIScreen.main.bounds.width / 2 - 40
    
    var body: some View {
        VStack {
            Text(title)
                .padding()
                .lineLimit(3)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            Text("\(value)")
                .padding()
                .font(.system(size: 35, weight: .semibold, design: .rounded))
        }
        .frame(width: size, height: size, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 6).brightness(0.1)
        )
        .onTapGesture {
            value += 1
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemView(title: "String", value: 11).previewDevice("iPhone 11")
        }
    }
}
