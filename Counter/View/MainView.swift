//
//  ContentView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 28/12/2020.
//

import SwiftUI

struct MainView: View {
    
    let mainColor = Color("main")
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @State var isNewItemViewOpen = false
    @State var items = [
        Item(title: "hello", value: 12),
        Item(title: "Nice", value: 124),
        Item(title: "Good", value: 53)
    ]
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    Spacer()
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
                        Image(systemName: "plus")
                        .foregroundColor(mainColor)
                        .onTapGesture {
                            withAnimation {
                                isNewItemViewOpen.toggle()
                            }
                        }
                    
                )
            }
            DarkenedViewBackground(visible: $isNewItemViewOpen, mainColor: mainColor)
            if isNewItemViewOpen {
                NewItemView(items: $items, viewState: $isNewItemViewOpen)
            }
            
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 Pro Max")
    }
}

