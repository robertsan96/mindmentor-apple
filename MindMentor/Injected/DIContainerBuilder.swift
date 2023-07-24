//
//  DIContainerBuilder.swift
//  MindMentor
//
//  Created by Robert-Dumitru Sandru on 17.06.2023.
//

import Foundation

struct DIContainerBuilder {
    
    let interactors: Interactors
    
    init(interactors: Interactors) {
        self.interactors = interactors
    }
}

extension DIContainerBuilder {
    static var live: DIContainerBuilder {
        // Clients
        let userDefaultsClient = UserDefaultsClient()
        
        // APIServerInteractor
        let API_ServerDataSource = UserDefaultsAPIServerDataSource(client: userDefaultsClient)
        let API_ServerRepository = APIServerRepository(dataSource: API_ServerDataSource)
        let API_ServerInteractor = APIServerInteractor(repository: API_ServerRepository)
        
        // InterestInteractor
        let interestInteractor = InterestInteractor()
        
        // LogInteractor
        let XcodeTerminalLogDataSource = XcodeTerminalLogDataSource()
        let logRepository = LogRepository(dataSource: XcodeTerminalLogDataSource)
        let logInteractor = LogInteractor(logRepository: logRepository)
        
        let interactors = Interactors(logInteractor: logInteractor,
                                      interestInteractor: interestInteractor,
                                      APIServerInteractor: API_ServerInteractor)
        return DIContainerBuilder(interactors: interactors)
    }
    
    static var preview: DIContainerBuilder {
        // Clients
        let userDefaultsClient = UserDefaultsClient()
        
        // APIServerInteractor
        let API_ServerDataSource = UserDefaultsAPIServerDataSource(client: userDefaultsClient)
        let API_ServerRepository = APIServerRepository(dataSource: API_ServerDataSource)
        let API_ServerInteractor = APIServerInteractor(repository: API_ServerRepository)
        
        // InterestInteractor
        let interestInteractor = InterestInteractor()
        
        // LogInteractor
        let XcodeTerminalLogDataSource = XcodeTerminalLogDataSource()
        let logRepository = LogRepository(dataSource: XcodeTerminalLogDataSource)
        let logInteractor = LogInteractor(logRepository: logRepository)
        
        let interactors = Interactors(logInteractor: logInteractor,
                                      interestInteractor: interestInteractor,
                                      APIServerInteractor: API_ServerInteractor)
        return DIContainerBuilder(interactors: interactors)
    }
}
