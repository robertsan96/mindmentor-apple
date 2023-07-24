//
//  Log.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

struct Log: Identifiable {
    let id: UUID
    let message: String
    let time: Date
    let severity: Severity
}

extension Log {
    enum Severity: String {
        case info
        case warning
        case critical
    }
}
