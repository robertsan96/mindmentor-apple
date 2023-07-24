//
//  APIServerRepository.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 13.06.2023.
//

import Foundation

protocol APIServerRepositoryProtocol {
    
    func availableServers() async throws -> [APIServer]
    func setAvailableServers(APIServers: [APIServer]) async throws
}
