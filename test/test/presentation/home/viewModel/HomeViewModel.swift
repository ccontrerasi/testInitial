//
//  
//  HomeViewModel.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//
//  Created by Christian Contreras
//
import Foundation
import Combine

protocol HomeViewModelProtocol: ObservableObject {
}

final class HomeViewModel: ObservableObject, HomeViewModelProtocol, IHomeFlowStateProtocol {
    // MARK: - Properties
    @Published private(set) var state: LoadableState<[Home]> = .idle
    @Published var activeLink: HomeNavigationLink?
    private let useCase: HomeUseCase
        
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Public
    func exampleInvocation() {
        state = .loading
        useCase
            .execute()
            .delay(for: 1.5, scheduler: RunLoop.main)
            .assign(to: &$state)
    }
}
