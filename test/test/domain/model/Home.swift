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
    let id: Int
    let show: [Show]

    init(dto: HomeDTO){
        id = dto.totalCount
        show = dto.shows.compactMap({ showDTO in
            Show(dto: showDTO)
        })
    }
}

struct Show {
    let eventId: String
    let year: Int
    let title: String
    
    init(dto: ShowDTO) {
        eventId = dto.eventId
        year = dto.year
        title = dto.title
    }
}
