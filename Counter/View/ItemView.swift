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
    @State var id: String
    
    var itemViewModel: ItemViewModel
    
    let size = UIScreen.main.bounds.width / 2 - 40
    
    var body: some View {
        VStack {
            Text(title)
                .padding()
                .lineLimit(nil)
                .font(Assets.setBasicFont(size: 20))
            Text("\(value)")
                .padding()
                .font(Assets.setBasicFont(size: 35))
        }
        .frame(width: size, height: size, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Assets.mainColor, lineWidth: 6)
                .brightness(0.1)
        )
        .onTapGesture {
            value += 1
            itemViewModel.updateItem(title: title)
        }
        .onLongPressGesture {
            withAnimation {
                itemViewModel.deleteItem(title: title)
                itemViewModel.getItem()
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemView(
                title: "String",
                value: 11,
                id: "bobo",
                itemViewModel: ItemViewModel()
            )
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11")
        }
    }
}
