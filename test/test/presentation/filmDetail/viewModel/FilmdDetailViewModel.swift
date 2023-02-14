//
//  
//  FilmdDetailViewModel.swift
//  test
//
//  Created by Cristian Contreras on 14/2/23.
//
//  Created by Christian Contreras
//
import Foundation
import Combine

protocol FilmdDetailViewModelProtocol: ObservableObject {
}

final class FilmdDetailViewModel: ObservableObject, FilmdDetailViewModelProtocol, IFilmdDetailFlowStateProtocol {
    // MARK: - Properties
    @Published private(set) var state: LoadableState<Show> = .idle
    @Published var activeLink: FilmdDetailNavigationLink?
    private let useCase: FilmdDetailUseCase
        
    init(useCase: FilmdDetailUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Public
    /*func exampleInvocation() {
        state = .loading
        
        useCase
            .execute()
            .delay(for: 1.5, scheduler: RunLoop.main)
            .assign(to: &$state)
    }*/
}
