//
//  FlashcardView.swift
//  StudyBuddy
//
//  Created by Ivan The on 1/1/22.
//

import SwiftUI

struct FlashcardView: View {
    
    @ObservedObject var viewModel: VocabularyList
    
    var cards: Array<FlashcardLogic.Flashcard> {viewModel.flashcards}
    var indexOfTop: Int {viewModel.indexOfTop}
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("Material White")/*@END_MENU_TOKEN@*/)
            VStack {
                ProgressBar(numOfCards: cards.count, numOfSwiped: indexOfTop).padding()
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                            withAnimation(.default) {
                                viewModel.swipeCardAt(indexOfTop - 1, "back")
                                print(indexOfTop)
                        }
                    }) {SquareButton()}
                    Spacer()
                    Button(action: {
                            withAnimation(.default) {
                                viewModel.swipeCardAt(indexOfTop - 1, "back")
                                print(indexOfTop)
                        }
                    }) {SquareButton()}
                    Spacer()
                }.padding(.bottom, 20.0)
            }
            ZStack {
                ForEach(cards.reversed()) { flashcard in
                    Flashcard(viewModel: viewModel, flashcard: flashcard)
                }
            }.padding(.bottom, 50.0)
        }
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        let list = VocabularyList()
        FlashcardView(viewModel: list)
        FlashcardView(viewModel: list)
            .previewDevice("iPhone SE (2nd generation)")
    }
}
