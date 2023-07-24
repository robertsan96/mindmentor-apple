//
//  APIEndpoint.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 12.06.2023.
//

import Foundation

protocol APIEndpoint {
    var path: String { get }
}

extension APIEndpoint {
    
    // MARK: - Helpers
    
    /// Builds the full URL, including path, query params etc.
    func url(from baseURL: URL, queryParams: [String: String]? = nil) -> URL {
        // TODO: Add query param support and improve this function
        let components = URLComponents(string: baseURL.absoluteString)
        return components!.url!
    }
}
