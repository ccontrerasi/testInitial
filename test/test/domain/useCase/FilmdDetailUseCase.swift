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
    func execute(name: String?) -> AnyPublisher<LoadableState<Show>, Never>
}

class FilmdDetailUseCase: IFilmdDetailUseCase {
    
    // MARK: init
    func execute(name: String? = nil) -> AnyPublisher<LoadableState<Show>, Never> {
        return AnyPublisher(Just(.failed(RequestError.commonError))).eraseToAnyPublisher()
    }
}
