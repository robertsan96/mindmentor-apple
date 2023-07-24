//
//  UserDefaultsAPIServerDataSource.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 13.06.2023.
//

import Foundation

class UserDefaultsAPIServerDataSource: APIServerDataSource {
    
    private let client: UserDefaultsClient
    
    init(client: UserDefaultsClient) {
        self.client = client
    }
    
    func getAPIServers() async throws -> [APIServerDTO] {
        let data: Data = try await client.get(key: UserDefaultsAPIServerKey.availableServers.rawValue)
        let serversDTO = try JSONDecoder().decode([APIServerDTO].self, from: data)
        return serversDTO
    }
    
    func setAPIServers(APIServers: [APIServerDTO]) async throws {
        let data = try JSONEncoder().encode(APIServers)
        try await client.set(key: UserDefaultsAPIServerKey.availableServers.rawValue, value: data)
    }
}
