//
//  StudyBuddyApp.swift
//  StudyBuddy
//
//  Created by Ivan The on 12/31/21.
//

import SwiftUI

@main
struct StudyBuddyApp: App {
    let list = VocabularyList()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: list)
        }
    }
}
