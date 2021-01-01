//
//  ContentView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 28/12/2020.
//

import SwiftUI

struct MainView: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer(minLength: 30)
            LazyVGrid(columns: columns, alignment: .center, spacing: 20, content: {
                ForEach((0...20), id: \.self) {_ in
                    ItemView(title: "hello", value: 12)
                        .lineSpacing(10)
                }
            })
        }
        .padding(20)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice("iPhone 11")
    }
}
