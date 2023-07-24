//
//  DIContainer.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 14.06.2023.
//

import Foundation
import SwiftUI

struct DIContainer: EnvironmentKey {
    
    let interactors: Interactors
    
    static var defaultValue: Self { DIContainer.live }
}

extension EnvironmentValues {
    
    var diContainer: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

extension DIContainer {
    static var live: DIContainer {
        DIContainer(interactors: DIContainerBuilder.live.interactors)
    }
    
    static var preview: DIContainer {
        DIContainer(interactors: DIContainerBuilder.preview.interactors)
    }
}
