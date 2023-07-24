//
//  URLSessionAPIInterfaceAdapters.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 12.06.2023.
//

import Foundation

struct URLSessionAPIInterfaceAdapters {
    
    static func adapt(HTTPURLResponse response: HTTPURLResponse) -> APIURLResponse {
        return APIURLResponse(statusCode: response.statusCode)
    }
    
    static func adapt(data: Data, HTTPURLResponse response: HTTPURLResponse) -> APIResponse {
        return APIResponse(data: data, response: adapt(HTTPURLResponse: response))
    }
}
