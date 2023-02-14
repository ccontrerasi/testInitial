//
//  
//  Home.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//
//
import Foundation

struct Home {
    let id = UUID()
    let totalCount: Int
    let show: [Show]

    init(dto: HomeDTO){
        totalCount = dto.totalCount
        show = dto.shows.compactMap({ showDTO in
            Show(dto: showDTO)
        })
    }
}

struct Show {
    let eventId: String
    let id: String
    let year: Int
    let title: String
    let moviePictures: Picture?
    
    init(dto: ShowDTO) {
        eventId = dto.eventId
        id = dto.id
        year = dto.year
        title = dto.title
        if let pic = dto.moviePictures {
            moviePictures = Picture(dto: pic)
        } else {
            moviePictures = nil
        }
    }
}

struct Picture: Codable {
    let photo: String?
    let poster: String?
    let background: String?
    var pictureUrl: String? {
        get {
            guard let photo = self.photo else { return nil }
            return url_images + photo
        }
    }
    
    init(dto: MoviePicturesDTO) {
        photo = dto.photo
        poster = dto.poster
        background = dto.background
    }
}
