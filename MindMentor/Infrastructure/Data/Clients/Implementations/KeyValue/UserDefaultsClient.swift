//
//  UserDefaultsClient.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 12.06.2023.
//

import Foundation

class UserDefaultsClient: KeyValueClient {
    private let store: UserDefaults
    
    init(store: UserDefaults = .standard) {
        self.store = store
    }
    
    func get(key: String) async throws -> Data {
        guard let value = store.value(forKey: key) as? Data else { throw KeyValueClientError.invalidValue }
        return value
    }
    
    func get(key: String) async throws -> String {
        guard let value = store.value(forKey: key) as? String else { throw KeyValueClientError.invalidValue }
        return value
    }
    
    func set(key: String, value: String) async throws {
        store.set(value, forKey: key)
    }
    
    func set(key: String, value: Data) async throws {
        store.set(value, forKey: key)
    }
}
