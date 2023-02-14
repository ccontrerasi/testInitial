//
//  
//  HomeUseCase.swift
//
//  Created by Cristian Contreras on 9/2/23.
//
//
import Foundation
import Combine
import Rswift

protocol IHomeUseCase {
    func execute(name: String?) -> AnyPublisher<LoadableState<[Home]>, Never>
}

final class HomeUseCase: IHomeUseCase {
    let homeRepository: IHomeRepository
    
    init(homeRepository: IHomeRepository) {
        self.homeRepository = homeRepository
    }
    
    // MARK: init
    func execute(name: String? = nil) -> AnyPublisher<LoadableState<[Home]>, Never> {
        return homeRepository.fetchHomesInfo().compactMap {
            $0.map { homeDto in
                Home(dto: homeDto)
            } }.convertToLoadedState().eraseToAnyPublisher()
    }
}
