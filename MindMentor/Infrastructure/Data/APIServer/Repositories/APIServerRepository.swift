//
//  APIServerRepository.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 13.06.2023.
//

import Foundation

class APIServerRepository: APIServerRepositoryProtocol {
    
    private let dataSource: UserDefaultsAPIServerDataSource
    
    init(dataSource: UserDefaultsAPIServerDataSource) {
        self.dataSource = dataSource
    }
    
    func availableServers() async throws -> [APIServer] {
        let servers = try await dataSource.getAPIServers()
        let adapted = try Adapters.adapt(dataTransferObjects: servers)
        return adapted
    }
    
    func setAvailableServers(APIServers: [APIServer]) async throws {
        let serversDTO = Adapters.adapt(domainModels: APIServers)
        try await dataSource.setAPIServers(APIServers: serversDTO)
    }
}

// MARK: - Interface Adapters
extension APIServerRepository {
    class Adapters: InterfaceAdapter {
        static func adapt(dataTransferObject: APIServerDTO) throws -> APIServer {
            guard let uuid = UUID(uuidString: dataTransferObject.id) else { throw InterfaceAdapterError.castingFailed }
            guard let url = URL(string: dataTransferObject.url) else { throw InterfaceAdapterError.castingFailed }
            return APIServer(id: uuid,
                             title: dataTransferObject.title,
                             description: dataTransferObject.description,
                             url: url)
        }
        
        static func adapt(dataTransferObjects: [APIServerDTO]) throws -> [APIServer] {
            return try dataTransferObjects.map { try adapt(dataTransferObject: $0) }
        }
        
        static func adapt(domainModel: APIServer) -> APIServerDTO {
            return APIServerDTO(id: domainModel.id.uuidString,
                                title: domainModel.title,
                                description: domainModel.description,
                                url: domainModel.url.absoluteString)
        }
        
        static func adapt(domainModels: [APIServer]) -> [APIServerDTO] {
            return domainModels.map { adapt(domainModel: $0) }
        }
    }
}
