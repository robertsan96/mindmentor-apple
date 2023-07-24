//
//  URLSessionAPIClient.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 12.06.2023.
//

import Foundation

class URLSessionAPIClient: APIClient {
    
    static var shared = URLSessionAPIClient(urlSession: .shared)
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func get(url: URL, headers: APIHeaders) async throws -> APIResponse {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = APIMethod.get.rawValue
        let (data, urlResponse) = try await urlSession.data(for: urlRequest)
        guard let httpUrlResponse = urlResponse as? HTTPURLResponse else { throw URLSessionAPIError.notHTTPResponse }
        return URLSessionAPIInterfaceAdapters.adapt(data: data, HTTPURLResponse: httpUrlResponse)
    }
}

enum URLSessionAPIError: Error {
    case notHTTPResponse
}
