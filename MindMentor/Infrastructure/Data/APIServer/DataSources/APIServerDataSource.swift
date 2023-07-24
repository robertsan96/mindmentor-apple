//
//  APIServerDataSource.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 13.06.2023.
//

import Foundation

protocol APIServerDataSource: DataSource {
    func getAPIServers() async throws -> [APIServerDTO]
    func setAPIServers(APIServers: [APIServerDTO]) async throws
}
