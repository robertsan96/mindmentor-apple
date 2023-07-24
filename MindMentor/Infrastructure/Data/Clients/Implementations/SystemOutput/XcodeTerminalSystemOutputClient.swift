//
//  XcodeTerminalSystemOutputClient.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

class XcodeTerminalSystemOutputClient: SystemOutputClient {
    func out(_ message: String) async throws {
        print(message)
    }
}
