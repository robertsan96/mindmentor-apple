//
//  SystemOutputClient.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

protocol SystemOutputClient {
    func out(_ message: String) async throws
}

extension SystemOutputClient {
    func out(_ message: String) async throws {
        throw AppError.GeneralError.notImplemented
    }
}
