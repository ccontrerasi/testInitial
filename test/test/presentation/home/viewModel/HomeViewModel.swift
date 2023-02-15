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
    func loadInfo()
    func goToDetail(id: String)
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
    func loadInfo() {
        state = .loading
        useCase
            .execute()
            .delay(for: 1.5, scheduler: RunLoop.main)
            .assign(to: &$state)
    }
    
    func goToDetail(id: String){
        activeLink = .goToDetail(id: id)
    }
}
