//
//  ContentView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 28/12/2020.
//

import SwiftUI

struct MainView: View {
    
    let items = [
        Item(title: "hello", value: 12),
        Item(title: "Nice", value: 124),
        Item(title: "Good", value: 53)
    ]
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Spacer(minLength: 30)
                LazyVGrid(columns: columns, alignment: .center, spacing: 20, content: {
                    ForEach(items) {item in
                        ItemView(title: item.title, value: item.value)
                            .lineSpacing(10)
                    }
                })
            }
            .padding(.horizontal, 20)
            .navigationBarTitle(
                Text("Counters")
            )
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: NewItemView()) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
            )
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
