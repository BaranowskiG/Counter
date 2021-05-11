//
//  CounterApp.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 28/12/2020.
//

import SwiftUI

@main
struct CounterApp: App {
    
    @State var isNewUser = true //UserDefaults.standard.bool(forKey: "isNew")
    
    var body: some Scene {
        WindowGroup {
            if isNewUser {
                IntroductionView(isNewUser: $isNewUser)
            } else {
                MainView()
            }
        }
    }
}
