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
    func execute(name: String?) -> AnyPublisher<LoadableState<FilmdDetail>, Never>
}

class FilmdDetailUseCase: IFilmdDetailUseCase {
    
    // MARK: init
    func execute(name: String? = nil) -> AnyPublisher<LoadableState<FilmdDetail>, Never> {
        return AnyPublisher(Just(.failed(RequestError.commonError))).eraseToAnyPublisher()
    }
}
