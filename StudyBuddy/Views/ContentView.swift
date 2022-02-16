//
//  ContentView.swift
//  StudyBuddy
//
//  Created by Ivan The on 12/31/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: VocabularyList
    
    var body: some View {
        FlashcardView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let list = VocabularyList()
        ContentView(viewModel: list)
    }
}
