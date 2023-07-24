//
//  LogDTO.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

struct LogDTO: Codable {
    let id: String
    let message: String
    let time: String
    let severity: SeverityDTO
}

extension LogDTO {
    enum SeverityDTO: String, Codable {
        case info
        case warning
        case critical
    }
}
