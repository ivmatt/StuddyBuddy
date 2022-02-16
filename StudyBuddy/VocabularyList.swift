//
//  VocabularyList.swift
//  StudyBuddy
//
//  Created by Ivan The on 1/2/22.
//

import SwiftUI

class VocabularyList: ObservableObject {
    
    static var wordList = [["私","I"],
                           ["見る","See"],
                           ["食べ物","Food"],
                           ["私","I"],
                           ["見る","See"],
                           ["食べ物","Food"],
                           ["私","I"],
                           ["見る","See"],
                           ["食べ物","Food"]]
    
    static func createFlashcards() -> FlashcardLogic {
        FlashcardLogic(numberofFlashcards: wordList.count, createTermContent: {index in wordList[index][0]}, createDefContent: {index in wordList[index][1]})
    }
    
    @Published private var model: FlashcardLogic = createFlashcards()
    
    var flashcards: Array<FlashcardLogic.Flashcard> {
        model.flashcards
    }
    
    var indexOfTop: Int {
        model.indexOfTop
    }
    
    
    
    // MARK: - Intent(s)
    
    func swipeCardAt(_ indexOfNextCard: Int, _ direction: String) {
        model.swipeCardAt(indexOfNextCard, direction)
    }
    
    func left(_ flashcard: FlashcardLogic.Flashcard) {
        model.left(flashcard)
    }
    
    func right(_ flashcard: FlashcardLogic.Flashcard) {
        model.right(flashcard)
    }
    
    func syncTopCard() {
        model.syncTopCard()
    }
    
    func toggleFaceUp(_ flashcard: FlashcardLogic.Flashcard) {
        model.toggleFaceUp(flashcard)
    }
    
//    func nextCard() {
//        model.nextCard()
//    }
}
