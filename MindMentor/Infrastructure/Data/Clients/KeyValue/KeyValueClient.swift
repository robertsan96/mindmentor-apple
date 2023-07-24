//
//  UserDefaultsClient.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 12.06.2023.
//

import Foundation

protocol KeyValueClient {

    func get(key: String) async throws -> Data
    func get(key: String) async throws -> String
    
    func set(key: String, value: String) async throws
    func set(key: String, value: Data) async throws
}

enum KeyValueClientError: Error {
    case invalidValue
}
