//
//  HomeRepository.swift
//  test
//
//  Created by Cristian Contreras on 14/2/23.
//

import Foundation
import Rswift
import Combine

protocol IHomeRepository {
    func fetchHomesInfo() -> AnyPublisher<[HomeDTO], Error>
    func fetchShow(idShow: String) -> AnyPublisher<ShowDTO, Error>
}

class HomeRepository: IHomeRepository {
    func fetchHomesInfo() -> AnyPublisher<[HomeDTO], Error> {
        guard let path = R.file.last7dCineJson.path() else { return Fail(error: NSError(domain: "Missing Json file", code: -10001, userInfo: nil)).eraseToAnyPublisher() }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let homeDTO = try! decoder.decode([HomeDTO].self, from: data)
            
            homeDTO.forEach { homeDto in
                homeDto.shows.forEach {
                    let showDB = CoreDataHelper.saveShow(show: $0)
                    if let picture = $0.moviePictures {
                        let _ = CoreDataHelper.saveImageShow(image: picture, show: showDB)
                    }
                }
                
            }
            
            return Result<[HomeDTO], Error>.Publisher.init(homeDTO)
                .eraseToAnyPublisher()
            
        } catch {
            return Fail(error: NSError(domain: "Missing Parsing json file", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
    }
    
    func fetchShow(idShow: String) -> AnyPublisher<ShowDTO, Error> {
        guard let show = CoreDataHelper.getShow(showId: idShow) else { return Fail(error: NSError(domain: "Show doesn't found", code: -10001, userInfo: nil)).eraseToAnyPublisher() }
        
        var image : MoviePicturesDTO? = nil
        if let moviePicture = CoreDataHelper.getImageShow(show: show).first {
            image = MoviePicturesDTO(moviePicture)
        }
        return Result<ShowDTO, Error>.Publisher.init(ShowDTO(showDB: show, moviePictures: image))
                .eraseToAnyPublisher()
    }
    
}
