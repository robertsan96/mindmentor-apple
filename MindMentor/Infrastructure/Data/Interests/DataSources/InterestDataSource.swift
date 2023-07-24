//
//  InterestDataSource.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 11.06.2023.
//

import Foundation

protocol InterestDataSource: DataSource {
    func getDefaultInterests() async throws -> [InterestDTO]
}
