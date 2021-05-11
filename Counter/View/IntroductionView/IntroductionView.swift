//
//  IntroductionView.swift
//  Counter
//
//  Created by Grzegorz Baranowski on 08/01/2021.
//

import SwiftUI

struct IntroductionView: View {
    
    let staticText = ["Welcome to", "COUNTER", "Continue"]
    @Binding var isNewUser: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            VStack {
                Text(staticText[0])
                    .fontWeight(.black)
                    .font(Assets.setBasicFont(size: 30))
                    .foregroundColor(Assets.mainColor)
                Text(staticText[1])
                    .fontWeight(.black)
                    .font(Assets.setBasicFont(size: 40))
                    .foregroundColor(Assets.mainColor)
            }
            Spacer()
            VStack(alignment: .leading) {
                ForEach(Assets.newUserTips, id: \.self) { tip in
                    InformationView(title: tip.title, description: tip.description, imageName: tip.imageName)
                }
            }
            .padding(.horizontal)
            Spacer()
            Button(action: {
                isNewUser = false
                UserDefaults.standard.set(isNewUser, forKey: "isNew")
            }, label: {
                Text(staticText.last!)
                    .foregroundColor(Assets.secondaryColor)
            })
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(
                RoundedRectangle(
                    cornerRadius: 15,
                    style: .continuous
                )
                .fill(Assets.mainColor)
            )
            .padding()
            Spacer()
        }
    }
}

