//
//  LogDataSource.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

protocol LogDataSource: DataSource {
    func log(_ log: LogDTO) async throws
    func extract() async throws -> [LogDTO]
}

extension LogDataSource {
    
    func log(_ log: LogDTO) async throws {
        throw AppError.GeneralError.notImplemented
    }
    
    func extract() async throws -> [LogDTO] {
        throw AppError.GeneralError.notImplemented
    }
}
