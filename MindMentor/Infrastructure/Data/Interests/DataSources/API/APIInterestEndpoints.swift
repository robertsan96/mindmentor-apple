//
//  APIInterestEndpoint.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 12.06.2023.
//

import Foundation

enum APIInterestEndpoint: APIEndpoint {
    
    case defaultInterests
    
    var path: String {
        switch self {
        case .defaultInterests: return "/default"
        }
    }
}
