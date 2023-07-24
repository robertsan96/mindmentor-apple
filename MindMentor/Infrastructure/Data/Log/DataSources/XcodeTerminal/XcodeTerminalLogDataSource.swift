//
//  XcodeTerminalLogDataSource.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

class XcodeTerminalLogDataSource: LogDataSource {
    
    private var client = XcodeTerminalSystemOutputClient()
    private var logs: [LogDTO] = []
    
    func log(_ log: LogDTO) async throws {
        try await client.out(message(log: log))
        logs.append(log)
    }
    
    func extract() async throws -> [LogDTO] {
        return logs
    }
    
    private func message(log: LogDTO) -> String {
        let timeDouble = Double(log.time) ?? 0.0
        let logDate = Date(timeIntervalSince1970: timeDouble)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let date = formatter.string(from: logDate)
        let prefix: String
        switch log.severity {
        case .critical: prefix = "[CRIT ♦️ \(date)]"
        case .info: prefix = "[INFO 🔹 \(date)]"
        case .warning: prefix = "[WARN 🔸 \(date)]"
        }
        let message = prefix + " " + log.message
        return message
    }
}
