//
//  InterestRepository.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 11.06.2023.
//

import Foundation

class InterestRepository: InterestRepositoryProtocol {
    
    private let webAPIDataSource: APIInterestDataSource
    
    init(webAPIDataSource: APIInterestDataSource) {
        self.webAPIDataSource = webAPIDataSource
    }
    
    func defaultInterests() async throws -> [Interest] {
        let response = try await webAPIDataSource.getDefaultInterests()
        let adaptedInterests = try Adapters.adapt(dataTransferObjects: response)
        return adaptedInterests
    }
}

// MARK: - Interface Adapters
extension InterestRepository {
    class Adapters: InterfaceAdapter {
        static func adapt(dataTransferObject DTO: InterestDTO) throws -> Interest {
            guard let interestUUID = UUID(uuidString: DTO.id) else { throw InterfaceAdapterError.castingFailed }
            return Interest(id: interestUUID, title: DTO.title)
        }
        
        static func adapt(dataTransferObjects DTO: [InterestDTO]) throws -> [Interest] {
            return try DTO.map { try adapt(dataTransferObject: $0) }
        }
    }
}
