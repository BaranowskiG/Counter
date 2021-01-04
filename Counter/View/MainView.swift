//
//  ContentView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 28/12/2020.
//

import SwiftUI
import RealmSwift

struct MainView: View {
    
    @ObservedObject var itemViewModel = ItemViewModel()
    
    @State var isNewItemViewOpen = false
//    @State var items = [Item]()
        
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    Spacer()
                    LazyVGrid(
                        columns: Array(
                            repeating: .init(.flexible()),
                            count: 2),
                        alignment: .center,
                        spacing: 20,
                        content: {
                            
                            if itemViewModel.itemList != nil {
                                ForEach( 0..<itemViewModel.itemList!.count ) {index in
                                    ItemView(title: itemViewModel.itemList![index].title, value: itemViewModel.itemList![index].value)
                                        .lineSpacing(10)
                                }
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
                        .foregroundColor(Assets.mainColor)
                        .onTapGesture {
                            withAnimation {
                                isNewItemViewOpen.toggle()
                            }
                        }
                )
            }
            DarkenedViewBackground(visible: $isNewItemViewOpen)
            if isNewItemViewOpen {
                NewItemView(viewState: $isNewItemViewOpen)
            }
            
        }.onAppear {
            itemViewModel.getItem()
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
