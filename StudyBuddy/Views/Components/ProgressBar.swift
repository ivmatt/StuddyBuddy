//
//  ProgressBar.swift
//  StudyBuddy
//
//  Created by Ivan The on 1/2/22.
//

import SwiftUI

struct ProgressBar: View {
    
    var numOfCards: Int
    
    var numOfSwiped: Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 11)
                .frame(width: 310, height: 25)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("Material White")/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(/*@START_MENU_TOKEN@*/Color("Material White")/*@END_MENU_TOKEN@*/, lineWidth: 9)
                        .shadow(color: /*@START_MENU_TOKEN@*/Color("Dark Shadow")/*@END_MENU_TOKEN@*/, radius: 3, x: 7, y: 7)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color("Light Shadow"), radius: 3, x: -7, y: -7)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .foregroundColor(Color("Glowy Blue"))
                        .frame(width: (300/CGFloat(numOfCards)*CGFloat(numOfSwiped)) , height: 15)
                        .shadow(color: Color("Glowy Blue").opacity(0.5), radius: 7)
                        .padding(.leading, 5.0),
                    alignment: .leading)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("Material White")/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            ProgressBar(numOfCards: 10, numOfSwiped: 2)
        }
    }
}
