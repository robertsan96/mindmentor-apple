//
//  ContentView.swift
//  MindMentor
//
//  Created by Robert Sandru on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.diContainer) var diContainer
    
    @State private var text: String = ""
    
    var body: some View {
    
        AuthView()
        .task {
//            let interactor = diContainer.interactors.APIServerInteractor
//            let servers = try await diContainer.interactors.APIServerInteractor.availableAPIServers()
//            print(servers)
        }
//        DevHubMainView()
//            .environmentObject(DevHubMainModel(logInteractor: diContainer.interactors.logInteractor,
//                                               interestInteractor: diContainer.interactors.interestInteractor))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.diContainer, .preview)
    }
}
