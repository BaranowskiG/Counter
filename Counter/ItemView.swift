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
    
    let size = UIScreen.main.bounds.width / 2
    
    var body: some View {
        VStack {
            Text(title)
                .padding()
            Text("\(value)")
                .padding()
                
        }
        .background(Color.green)
        .cornerRadius(10)
        .onTapGesture {
            value += 1
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(title: "String", value: 12)
    }
}
