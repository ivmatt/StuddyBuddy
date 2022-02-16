//
//  CardView.swift
//  StudyBuddy
//
//  Created by Ivan The on 1/1/22.
//

import SwiftUI

struct Flashcard: View {
    
    @State var x: CGFloat = 0.0
    @State var y: CGFloat = 0.0
    @State var degree: CGFloat = 0.0
    @State var rotation = 0.0
    @State var flipped: Bool = false
    @State var contentRotation = 0.0
    
    var viewModel: VocabularyList
    var flashcard: FlashcardLogic.Flashcard
    
    var body: some View {
        ZStack {

//            RoundedRectangle(cornerRadius: 30)
//                .frame(width: UIScreen.main.bounds.width * 0.782,
//                       height: UIScreen.main.bounds.height * 0.6)
//                .foregroundColor(/*@START_MENU_TOKEN@*/Color("Material White")/*@END_MENU_TOKEN@*/)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 30)
//                        .strokeBorder(lineWidth: 2, antialiased: true)
//                        .frame(width: UIScreen.main.bounds.width * 0.782,
//                                height: UIScreen.main.bounds.height * 0.6)
//                        .foregroundColor(.white))
            
//            if flipped {
//                Text(flashcard.definition)
//                    .font(.system(size: 70))
//                    .padding()
//            } else {
//                if flashcard.id == viewModel.indexOfTop {
//                    Text(flashcard.term)
//                        .font(.system(size: 70))
//                        .padding()
//                } else {
//                    Text(flashcard.term)
//                        .font(.system(size: 70))
//                        .opacity(0.05)
//                        .padding()
//                }
//            }
            
            if flashcard.isFaceUp {
                Text(flashcard.definition)
                    .font(.system(size: 70))
                    .padding()
            } else {
                if flashcard.id == viewModel.indexOfTop {
                    Text(flashcard.term)
                        .font(.system(size: 70))
                        .padding()
                } else {
                    Text(flashcard.term)
                        .font(.system(size: 70))
                        .opacity(0.05)
                        .padding()
                }
            }
            
        }
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .frame(width: UIScreen.main.bounds.width * 0.782, height: UIScreen.main.bounds.height * 0.6)
        .background(/*@START_MENU_TOKEN@*/Color("Material White")/*@END_MENU_TOKEN@*/)
        .cornerRadius(30)
        .shadow(color: /*@START_MENU_TOKEN@*/Color("Dark Shadow")/*@END_MENU_TOKEN@*/,
                radius: flashcard.onTop ? 20 : 0,
                x: 0,
                y: 0
//                .shadow(color: .white, radius: 8, x: -10, y: -10)
                )
        .offset(x: flashcard.inStack ? x : flashcard.xOffset,
                y: y)
        .rotationEffect(.init(degrees: degree))
        .gesture (
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                        x = value.translation.width
                        y = value.translation.height
                        degree = 10 * (value.translation.width > 0 ? 1 : -1)
                    }
                }
            
                .onEnded { value in
                    withAnimation(.default) {
                        if x > 100 {
//                            viewModel.changeX(flashcard, 1000)
                            viewModel.right(flashcard)
//                            x = 1000
                        } else if x < -100 {
//                            viewModel.changeX(flashcard, -1000)
                            viewModel.left(flashcard)
//                            x = -1000
                        } else {
//                            viewModel.changeX(flashcard, 0)
//                            viewModel.changeY(flashcard, 0)
//                            viewModel.changeDegree(flashcard, 0)
                            x = 0
                            y = 0
                            degree = 0
                        }
                        x = 0
                        y = 0
                        degree = 0
                    }
                }
        )
        .onTapGesture {
            if flashcard.onTop {
                let animationTime = 0.3
                withAnimation(Animation.linear(duration: animationTime))  {
                    rotation += 180
                }
                withAnimation(Animation.linear(duration: 0.001).delay(animationTime/2)) {
                    contentRotation += 180
//                    flipped.toggle()
                    viewModel.toggleFaceUp(flashcard)
                }
            }
        }
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let list = VocabularyList()
        ZStack {
            Rectangle()
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("Material White")/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            Flashcard(viewModel: list, flashcard: VocabularyList.createFlashcards().flashcards[0])
        }
    }
}
