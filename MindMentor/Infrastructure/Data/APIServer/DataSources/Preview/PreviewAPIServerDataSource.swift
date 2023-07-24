//
//  PreviewAPIServerDataSource.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation

class PreviewAPIServerDataSource: APIServerDataSource {
    
    private var APIServers: [APIServerDTO] = []
    
    init(initialAPIServers APIServers: [APIServerDTO] = example1) {
        self.APIServers = APIServers
    }
    
    func getAPIServers() async throws -> [APIServerDTO] {
        return APIServers
    }
    
    func setAPIServers(APIServers: [APIServerDTO]) async throws {
        self.APIServers = APIServers
    }
}

extension PreviewAPIServerDataSource {
    static var example1: [APIServerDTO] = [
        APIServerDTO(id: "0775f571-04ef-481a-b712-9bb58c65c068",
                     title: "Preview MindMentor Develop",
                     description: "The develop branch release, for internal testing",
                     url: "https://develop.mindmentor.ai/api"),
        APIServerDTO(id: "0f5f01ef-56de-418b-8cb0-0ac25672d789",
                     title: "MindMentor QA",
                     description: "MindMentor QA API",
                     url: "https://qa.mindmentor.ai/api"),
        APIServerDTO(id: "565116c0-a7d8-4fee-a62d-efb12d22b2a9",
                     title: "MindMentor Production",
                     description: "MindMentor Production API",
                     url: "https://mindmentor.ai/api")
    ]
}
