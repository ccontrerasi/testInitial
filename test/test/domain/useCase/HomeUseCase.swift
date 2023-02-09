//
//  
//  HomeUseCase.swift
//  test
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
    
    // MARK: init
    func execute(name: String? = nil) -> AnyPublisher<LoadableState<[Home]>, Never> {
        guard let path = R.file.last7dCineJson.path() else { return AnyPublisher(Just(.failed(RequestError.commonError))).eraseToAnyPublisher() }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let homeDTO = try! decoder.decode([HomeDTO].self, from: data)
            
            return Result<[Home], Never>.Publisher.init(homeDTO.compactMap({ homeDTO in
                Home(dto: homeDTO)
            }))
                .convertToLoadedState()
                .eraseToAnyPublisher()
            
        } catch {
            return AnyPublisher(Just(.failed(RequestError.commonError))).eraseToAnyPublisher()
        }
    }
}
