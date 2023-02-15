//
//  
//  FilmdDetailUseCase.swift
//  test
//
//  Created by Cristian Contreras on 14/2/23.
//
//
import Foundation
import Combine

protocol IFilmdDetailUseCase {
    func execute(id: String) -> AnyPublisher<LoadableState<Show>, Never>
}

class FilmdDetailUseCase: IFilmdDetailUseCase {
    
    var repository: IHomeRepository
    
    init(repository: IHomeRepository) {
        self.repository = repository
    }
    
    // MARK: init
    func execute(id: String) -> AnyPublisher<LoadableState<Show>, Never> {
        return AnyPublisher(Just(.failed(RequestError.commonError))).eraseToAnyPublisher()
    }
}
