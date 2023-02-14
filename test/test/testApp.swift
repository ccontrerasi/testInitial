//
//  testApp.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//

import SwiftUI

@main
struct testApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            // TODO: Esto hay que pasarlo por injection
            let vc = HomeViewModel(useCase: HomeUseCase(homeRepository: HomeRepository()))
            HomeViewController(viewModel: vc)
        }
    }
}
