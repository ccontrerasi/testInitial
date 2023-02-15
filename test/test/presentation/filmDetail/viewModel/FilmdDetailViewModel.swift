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
    private let idFilm: String
        
    init(useCase: FilmdDetailUseCase, idFilm: String) {
        self.useCase = useCase
        self.idFilm = idFilm
    }
    
    // MARK: - Public
    func loadInfo() {
        state = .loading
        useCase
            .execute(id: idFilm)
            .assign(to: &$state)
    }
}
