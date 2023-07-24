//
//  LogRepository.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

struct LogRepository: LogRepositoryProtocol {
    
    private let dataSource: LogDataSource
    
    init(dataSource: LogDataSource = XcodeTerminalLogDataSource()) {
        self.dataSource = dataSource
    }
    
    func log(_ log: Log) async throws {
        let logDTO = try Adapters.adapt(domainModel: log)
        try await dataSource.log(logDTO)
    }
    
    func extract() async throws -> [Log] {
        let logDTOs = try await dataSource.extract()
        let logs = try Adapters.adapt(dataTransferObjects: logDTOs)
        return logs
    }
}

extension LogRepository {
    
    class Adapters: InterfaceAdapter {
        
        static func adapt(dataTransferObject: LogDTO) throws -> Log {
            let severity = Log.Severity(rawValue: dataTransferObject.severity.rawValue)
            guard let severity,
                  let uuid = UUID(uuidString: dataTransferObject.id),
                  let timeDouble = Double(dataTransferObject.time)
            else { throw InterfaceAdapterError.castingFailed }
            let date = Date(timeIntervalSince1970: timeDouble)
            return Log(id: uuid, message: dataTransferObject.message, time: date, severity: severity)
        }
        
        static func adapt(dataTransferObjects: [LogDTO]) throws -> [Log] {
            return try dataTransferObjects.map { try adapt(dataTransferObject: $0) }
        }
        
        static func adapt(domainModel model: Log) throws -> LogDTO {
            let severityDTO = LogDTO.SeverityDTO.init(rawValue: model.severity.rawValue)
            guard let severityDTO else { throw InterfaceAdapterError.castingFailed }
            return LogDTO(id: model.id.description,
                          message: model.message,
                          time: model.time.timeIntervalSince1970.description,
                          severity: severityDTO)
        }
    }
}
