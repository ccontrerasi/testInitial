//
//  
//  HomeModel.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//
//
import Foundation

struct HomeDTO : Codable {
    let totalCount: Int
    let shows: [ShowDTO]
}

// MARK: - Show
struct ShowDTO: Codable {
    let eventId: String
    let kind: Kind
    let programId: String
    let actors: [String]
    let ageCode: AgeCode
    let beginTime: String
    let catchup: Bool
    let category: Category
    let channel, channelName: String
    let country, directors: [String]
    let endTime, episodeTitle: String
    let language: Language
    let length: Int
    let moviePictures: MoviePictures
    let seasonId, serieId, synopsis, synopsisEpisode: String
    let synopsisLong: String
    let tags: [Tag]
    let title: String
    let type: Int
    let writers: [String]
    let year: Int
    let fastVodEnabled: Bool?
    let url: String
    let startBookmark: Int?
    let id: String
    let score: Double
    let channelPremium: Bool?
}

enum AgeCode: String, Codable {
    case sc = "SC"
    case the12 = "+12"
    case the13 = "+13"
    case the16 = "+16"
    case the18 = "+18"
    case the7 = "+7"
    case tp = "TP"
}

enum Category: String, Codable {
    case the5A3A32E5Cd93B24C39Bdf19D = "5a3a32e5cd93b24c39bdf19d"
}

enum Kind: String, Codable {
    case mediaProduction = "MediaProduction"
}

enum Language: String, Codable {
    case cat = "CAT"
    case eus = "EUS"
    case glg = "GLG"
    case spa = "SPA"
    case val = "VAL"
}

// MARK: - MoviePictures
struct MoviePictures: Codable {
    let photo: String
    let poster: String?
    let background: String
}

enum Tag: String, Codable {
    case acción = "Acción"
    case adultos = "Adultos"
    case animación = "Animación"
    case artesMarciales = "Artes marciales"
    case aventuras = "Aventuras"
    case bélica = "Bélica"
    case cienciaFicción = "Ciencia ficción"
    case cine = "Cine"
    case cineDeAutor = "Cine de autor"
    case cineNegro = "Cine Negro"
    case comedia = "Comedia"
    case deportiva = "Deportiva"
    case documental = "Documental"
    case drama = "Drama"
    case erótica = "Erótica"
    case erótico = "Erótico"
    case familiar = "Familiar"
    case fantástico = "Fantástico"
    case histórica = "Histórica"
    case histórico = "Histórico"
    case infantil = "Infantil"
    case musical = "Musical"
    case oeste = "Oeste"
    case otros = "Otros"
    case policíaco = "Policíaco"
    case romántica = "Romántica"
    case suspense = "Suspense"
    case suspenseThriller = "Suspense / Thriller"
    case tagCienciaFicción = "Ciencia Ficción"
    case telefilme = "Telefilme"
    case terror = "Terror"
    case western = "Western"
}
