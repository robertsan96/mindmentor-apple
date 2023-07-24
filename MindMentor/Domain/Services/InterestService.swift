//
//  InterestService.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 12.06.2023.
//

import Foundation

class InterestService {
    
    private let interestRepository: InterestRepositoryProtocol
    
    init(interestsRepository: InterestRepositoryProtocol) {
        self.interestRepository = interestsRepository
    }
    
    func getDefaultInterests() async throws -> [Interest] {
        return try await interestRepository.defaultInterests()
    }
}
