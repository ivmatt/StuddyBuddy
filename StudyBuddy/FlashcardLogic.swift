//
//  FlashCardLogic.swift
//  StudyBuddy
//
//  Created by Ivan The on 1/1/22.
//

import Foundation
import UIKit
import SwiftUI

struct FlashcardLogic {
    
    private(set) var flashcards: Array<Flashcard>
    
    var indexOfTop = 0
    
    mutating func swipeCardAt(_ index: Int, _ direction: String) {
        if direction == "left" {
            flashcards[index].xOffset = -1000
            indexOfTop += 1
            flashcards[index].inStack.toggle()
            print("executed 1")
        } else if direction == "right" {
            flashcards[index].xOffset = 1000
            indexOfTop += 1
            flashcards[index].inStack.toggle()
            print("executed 2")
        } else {
            if indexOfTop > 0 {
                indexOfTop -= 1
                flashcards[index].inStack.toggle()
                print("executed 3")
            }
        }
        syncTopCard()
        print("executed")
    }
    
    mutating func left(_ flashcard: Flashcard) {
        let chosenIndex = flashcards.firstIndex(where: {$0.id == flashcard.id})!
        swipeCardAt(chosenIndex, "left")
    }
    
    mutating func right(_ flashcard: Flashcard) {
        let chosenIndex = flashcards.firstIndex(where: {$0.id == flashcard.id})!
        swipeCardAt(chosenIndex, "right")
    }
    
    mutating func syncTopCard() {
        for card in flashcards {
            if card.id == indexOfTop {
                flashcards[card.id].onTop = true
            } else {
                flashcards[card.id].onTop = false
            }
        }
    }
    
    mutating func toggleFaceUp(_ flashcard: Flashcard) {
        let chosenIndex = flashcards.firstIndex(where: {$0.id == flashcard.id})!
        flashcards[chosenIndex].isFaceUp.toggle()
    }
    
//    mutating func nextCard() {
//        let previousCard = indexOfCurrentCard
//        if indexOfCurrentCard + 1 == flashcards.count {
//            indexOfCurrentCard = 0
//            flashcards[previousCard].isFaceUp = false
//        } else {
//            indexOfCurrentCard += 1
//            flashcards[previousCard].isFaceUp = false
//        }
//    }
    
    init(numberofFlashcards: Int, createTermContent: (Int) -> String, createDefContent: (Int) -> String) {
        
        flashcards = Array<Flashcard>()
        
        for index in 0..<numberofFlashcards {
            let termContent = createTermContent(index)
            let defContent = createDefContent(index)
            flashcards.append(Flashcard(term: termContent, definition: defContent, id: index ))
        }
        syncTopCard()
    }
    
    struct Flashcard: Identifiable{
        var term: String
        var definition: String
        var id: Int
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        var inStack : Bool = true
        var onTop: Bool = false
        var isFaceUp: Bool = false
    }
}

