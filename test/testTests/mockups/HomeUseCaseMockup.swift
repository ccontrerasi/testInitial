//
//  HomeUseCaseMockup.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//

import Foundation
import Combine
@testable import test

protocol IHomeUseCaseMockup {
    func execute(name: String?) -> AnyPublisher<LoadableState<[Home]>, Never>
}

final class HomeUseCaseMockup: IHomeUseCaseMockup {
    
    // MARK: init
    func execute(name: String? = nil) -> AnyPublisher<LoadableState<[Home]>, Never> {
        
        do {
            let path = Bundle(for: HomeUseCaseMockup.self).path(forResource: "test.cine.json", ofType: nil)!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let homeDTO = try! decoder.decode([HomeDTO].self, from: data)
            let result = homeDTO.compactMap { dto in
                Home(dto: dto)
            }
            return AnyPublisher(Just(result)).convertToLoadedState().eraseToAnyPublisher()
            
        } catch {
            return AnyPublisher(Just(.failed(RequestError.commonError))).eraseToAnyPublisher()
        }
    }
}
