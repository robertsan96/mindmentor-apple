//
//  APIServer.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 13.06.2023.
//

import Foundation

/// Needed for the ability to switch between environments & future B2B support
struct APIServer: Identifiable {
    let id: UUID
    let title: String
    let description: String
    let url: URL
}
