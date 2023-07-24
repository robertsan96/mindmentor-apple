//
//  APIServerInteractor.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 15.06.2023.
//

import Foundation

protocol APIServerInteractorProtocol {
    func setAvailableServers(APIServers: [APIServer]) async throws
    func availableAPIServers() async throws -> [APIServer]
}

struct APIServerInteractor: APIServerInteractorProtocol {
    private let repository: APIServerRepositoryProtocol
    
    init(repository: APIServerRepositoryProtocol) {
        self.repository = repository
    }
    
    func setAvailableServers(APIServers: [APIServer]) async throws {
        return try await repository.setAvailableServers(APIServers: APIServers)
    }
    
    func availableAPIServers() async throws -> [APIServer] {
        return try await repository.availableServers()
    }
}
