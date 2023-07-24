//
//  APIResponse.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 12.06.2023.
//

import Foundation

struct APIResponse {
    let data: Data
    let response: APIURLResponse
}

struct APIURLResponse {
    let statusCode: Int
}
