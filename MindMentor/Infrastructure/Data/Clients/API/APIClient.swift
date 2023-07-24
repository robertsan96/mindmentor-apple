//
//  APIClient.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 11.06.2023.
//

import Foundation

enum APIMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
}

enum APIHeaderOption: String {
    case applicationJson = "application/json"
}

enum APIHeader {
    case contentType(APIHeaderOption)
    
    var key: String {
        switch self {
        case .contentType: return "Content-Type"
        }
    }
}

typealias APIBody = [String: Any]
typealias APIHeaders = [APIHeader]

protocol APIClient {
    
    // MARK: - Methods
    func get(url: URL, headers: APIHeaders) async throws -> APIResponse
    func get(endpoint: APIEndpoint, headers: APIHeaders) async throws -> APIResponse
    
    func post(url: URL, body: APIBody, headers: APIHeaders) async throws -> APIResponse
    func post(endpoint: APIEndpoint, body: APIBody, headers: APIHeaders) async throws -> APIResponse
    
    func put(url: URL, body: APIBody, headers: APIHeaders) async throws -> APIResponse
    func put(endpoint: APIEndpoint, body: APIBody, headers: APIHeaders) async throws -> APIResponse
    
    func patch(url: URL, body: APIBody, headers: APIHeaders) async throws -> APIResponse
    func patch(endpoint: APIEndpoint, body: APIBody, headers: APIHeaders) async throws -> APIResponse
}

// Implementations
extension APIClient {
    
    func get(url: URL, headers: APIHeaders) async throws -> APIResponse {
        throw AppError.GeneralError.notImplemented
    }
    
    func get(endpoint: APIEndpoint, headers: APIHeaders) async throws -> APIResponse {
        throw AppError.GeneralError.notImplemented
    }
    
    func post(url: URL, body: APIBody, headers: APIHeaders) async throws -> APIResponse {
        throw AppError.GeneralError.notImplemented
    }
    
    func post(endpoint: APIEndpoint, body: APIBody, headers: APIHeaders) async throws -> APIResponse {
        throw AppError.GeneralError.notImplemented
    }
    
    func put(url: URL, body: APIBody, headers: APIHeaders) async throws -> APIResponse {
        throw AppError.GeneralError.notImplemented
    }
    
    func put(endpoint: APIEndpoint, body: APIBody, headers: APIHeaders) async throws -> APIResponse {
        throw AppError.GeneralError.notImplemented
    }
    
    func patch(url: URL, body: APIBody, headers: APIHeaders) async throws -> APIResponse {
        throw AppError.GeneralError.notImplemented
    }
    
    func patch(endpoint: APIEndpoint, body: APIBody, headers: APIHeaders) async throws -> APIResponse {
        throw AppError.GeneralError.notImplemented
    }
}
