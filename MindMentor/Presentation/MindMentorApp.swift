//
//  MindMentorApp.swift
//  MindMentor
//
//  Created by Robert Sandru on 08.06.2023.
//

import SwiftUI

@main
struct MindMentorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.diContainer, .live)
        }
    }
}
