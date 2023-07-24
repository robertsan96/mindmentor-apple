//
//  APIInterestDataSource.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 11.06.2023.
//

import Foundation

class APIInterestDataSource: InterestDataSource {

    private let client: APIClient
    private let APIServer: APIServer
    private var jsonDecoder: JSONDecoder
    private var jsonEncoder: JSONEncoder
    
    init(client: APIClient = URLSessionAPIClient.shared,
         APIServer: APIServer,
         jsonDecoder: JSONDecoder = JSONDecoder(),
         jsonEncoder: JSONEncoder = JSONEncoder()) {
        self.client = client
        self.APIServer = APIServer
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }
    
    func getDefaultInterests() async throws -> [InterestDTO] {
        let headers: APIHeaders = [.contentType(.applicationJson)]
        let response = try await client.get(endpoint: APIInterestEndpoint.defaultInterests, headers: headers)
        let interestDTOs = try jsonDecoder.decode([InterestDTO].self, from: response.data)
        return interestDTOs
    }
}
