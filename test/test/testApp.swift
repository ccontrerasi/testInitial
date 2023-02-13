//
//  testApp.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//

import SwiftUI

@main
struct testApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            // TODO: Esto hay que pasarlo por injection
            let vc = HomeViewModel(useCase: HomeUseCase())
            HomeCoordinator(state: vc, content: {
                HomeViewController(viewModel: vc)
            })
        }
    }
}
