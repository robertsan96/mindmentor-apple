//
//  LogRepositoryProtocol.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

protocol LogRepositoryProtocol {
    
    func log(_ log: Log) async throws
    func extract() async throws -> [Log]
}

extension LogRepositoryProtocol {
    func log(_ log: Log) async throws {
        throw AppError.GeneralError.notImplemented
    }
    
    func extract() async throws -> [Log] {
        throw AppError.GeneralError.notImplemented
    }
}
