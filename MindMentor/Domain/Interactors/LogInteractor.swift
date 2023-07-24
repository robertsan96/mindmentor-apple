//
//  LogInteractor.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

protocol LogInteractorProtocol {
    func log(_ severity: Log.Severity, message: String) async throws
    func log(_ severity: Log.Severity, message: String)
    func extractLogs() async throws -> [Log]
}

struct LogInteractor: LogInteractorProtocol {
    private let logRepository: LogRepositoryProtocol
    
    init(logRepository: LogRepositoryProtocol) {
        self.logRepository = logRepository
    }
    
    func log(_ severity: Log.Severity, message: String) async throws {
        let log = Log(id: .init(), message: message, time: Date.now, severity: severity)
        try await logRepository.log(log)
    }
    
    func log(_ severity: Log.Severity, message: String) {
        Task {
            try await self.log(severity, message: message)
        }
    }
    
    func extractLogs() async throws -> [Log] {
        return try await logRepository.extract()
    }
}
