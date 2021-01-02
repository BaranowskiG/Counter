//
//  ContentView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 28/12/2020.
//

import SwiftUI

struct MainView: View {
    
    @State var items = [
        Item(title: "hello", value: 12),
        Item(title: "Nice", value: 124),
        Item(title: "Good", value: 53)
    ]
    @State var isNewItemViewOpen = false
    
    let mainColor = Color("main")
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    
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
                            isNewItemViewOpen.toggle()
                        }
                )
            }
            Color.black.opacity(isNewItemViewOpen ? 0.9 : 0.0)
            .accentColor(mainColor)
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

struct NewItemView: View {
    
    @State var newItemName: String = ""
    @Binding var items: [Item]
    @Binding var viewState: Bool
    
    var body: some View {
        VStack {
            Text("Create new counter")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            TextField("Title", text: $newItemName, onCommit: addNewItem)
                .padding()
                .background(Color.black)
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 20).stroke(Color("main"), lineWidth: 6).brightness(0.1)
                )
                .padding(40)
        }
    }
    
    func addNewItem() -> Void {
        items.append(Item(title: newItemName, value: 0))
        newItemName = ""
        viewState = false
    }
}
