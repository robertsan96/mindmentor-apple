//
//  InterfaceAdapter.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 13.06.2023.
//

import Foundation

/// Base class that interface adapters are going to inherit. Provides a centralized / unified
/// way for error handling & general inheritance goodies.
class InterfaceAdapter {
    enum InterfaceAdapterError: Error {
        case castingFailed
    }
}
