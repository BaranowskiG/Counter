//
//  NewItemView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 01/01/2021.
//

import SwiftUI

struct NewItemView: View {
    
    @State var newItemTitle: String = ""
    
    var body: some View {
        VStack {
            ItemView(title: newItemTitle, value: 0)
                .padding()
            Text("Preview")
                .padding()
            Spacer()
            TextField("Type here", text: $newItemTitle)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 5).brightness(0.1)
                )
            Spacer()
        }
        .padding(20)
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView().previewDevice("iPhone 11")
    }
}
