//
//  ContentView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 28/12/2020.
//

import SwiftUI

struct MainView: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10, content: {
                ForEach((0...10), id: \.self) {_ in
                    ItemView(title: "hello", value: 12)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice("iPhone 11")
    }
}
