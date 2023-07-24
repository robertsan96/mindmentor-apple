//
//  InterestRepositoryProtocol.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 11.06.2023.
//

import Foundation

protocol InterestRepositoryProtocol {
    
    func defaultInterests() async throws -> [Interest]
}
