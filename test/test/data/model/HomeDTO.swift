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
    let kind: KindDTO
    let programId: String
    let actors: [String]
    let ageCode: AgeCodeDTO
    let beginTime: String
    let catchup: Bool
    let channel, channelName: String
    let country, directors: [String]
    let endTime, episodeTitle: String
    let language: LanguageDTO
    let length: Int
    let moviePictures: MoviePicturesDTO
    let seasonId, serieId, synopsis, synopsisEpisode: String
    let synopsisLong: String
    let tags: [TagDTO]
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

enum AgeCodeDTO: String, Codable {
    case sc = "SC"
    case the12 = "+12"
    case the13 = "+13"
    case the16 = "+16"
    case the18 = "+18"
    case the7 = "+7"
    case tp = "TP"
}

enum KindDTO: String, Codable {
    case mediaProduction = "MediaProduction"
}

enum LanguageDTO: String, Codable {
    case cat = "CAT"
    case eus = "EUS"
    case glg = "GLG"
    case spa = "SPA"
    case val = "VAL"
}

// MARK: - MoviePictures
struct MoviePicturesDTO: Codable {
    let photo: String
    let poster: String?
    let background: String
}

enum TagDTO: String, Codable {
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
