//
//  SquareButton.swift
//  StudyBuddy
//
//  Created by Ivan The on 1/1/22.
//

import SwiftUI

struct SquareButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color("Material White"))
            .frame(width: 70.0, height: 70.0)
            .shadow(color: Color("Dark Shadow"),
                    radius: 10,
                    x: 15,
                    y: 15)
            .shadow(color: Color("Light Shadow"),
                    radius: 10,
                    x: -15,
                    y: -15)
    }
}

struct SquareButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("Material White")/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            SquareButton()
        }
    }
}
