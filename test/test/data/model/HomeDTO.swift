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
    let moviePictures: MoviePicturesDTO?
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
    
    init(eventId: String, kind: KindDTO, programId: String, actors: [String],
         ageCode: AgeCodeDTO, beginTime: String, catchup: Bool, channel: String,
         channelName: String, country: [String], directors: [String],
         endTime: String, episodeTitle: String, language: LanguageDTO,
         length: Int, moviePictures: MoviePicturesDTO, seasonId: String,
         serieId: String, synopsis: String, synopsisEpisode: String, synopsisLong: String,
         tags: [TagDTO], title: String, type: Int, writers: [String], year: Int, fastVodEnabled: Bool?,
         url: String, startBookmark: Int?, id: String, score: Double, channelPremium: Bool?) {
        self.eventId = eventId
        self.kind = kind
        self.programId = programId
        self.actors = actors
        self.ageCode = ageCode
        self.beginTime = beginTime
        self.catchup = catchup
        self.channel = channel
        self.channelName = channelName
        self.country = country
        self.directors = directors
        self.endTime = endTime
        self.episodeTitle = episodeTitle
        self.language = language
        self.length = length
        self.moviePictures = moviePictures
        self.seasonId = seasonId
        self.serieId = serieId
        self.synopsis = synopsis
        self.synopsisEpisode = synopsisEpisode
        self.synopsisLong = synopsisLong
        self.tags = tags
        self.title = title
        self.type = type
        self.writers = writers
        self.year = year
        self.fastVodEnabled = fastVodEnabled
        self.url = url
        self.startBookmark = startBookmark
        self.id = id
        self.score = score
        self.channelPremium = channelPremium
    }
    
    init(showDB:ShowDB, moviePictures: MoviePicturesDTO?) {
        // We are going to keep field as nilables in DB
        self.eventId = showDB.eventId ?? ""
        if let kindString = showDB.kind,
            let kind = KindDTO(rawValue: kindString) {
            self.kind = kind
        } else {
            self.kind = .mediaProduction
        }
        self.programId = showDB.programId ?? ""
        self.actors = showDB.actors ?? []
        if let ageCodeString = showDB.ageCode,
            let ageCode = AgeCodeDTO(rawValue: ageCodeString) {
            self.ageCode = ageCode
        } else {
            self.ageCode = .tp
        }
        self.beginTime = showDB.beginTime ?? ""
        self.catchup = showDB.catchup
        self.channel = showDB.channel ?? ""
        self.channelName = showDB.channelName ?? ""
        self.country = showDB.country ?? []
        self.directors = showDB.directors ?? []
        self.endTime = showDB.endTime ?? ""
        self.episodeTitle = showDB.episodeTitle ?? ""
        if let languageString = showDB.language,
           let language = LanguageDTO(rawValue: languageString) {
            self.language = language
        } else {
            self.language = .spa
        }
        self.length = Int(showDB.length)
        self.moviePictures = moviePictures
        self.seasonId = showDB.seasonId ?? ""
        self.serieId = showDB.serieId ?? ""
        self.synopsis = showDB.synopsis ?? ""
        self.synopsisEpisode = showDB.synopsisEpisode ?? ""
        self.synopsisLong = showDB.synopsisLong ?? ""
        if let tagsOb = showDB.tags {
            self.tags = tagsOb.compactMap { TagDTO(rawValue: $0) }
        } else {
            self.tags = []
        }
        self.title = showDB.title ?? ""
        self.type = Int(showDB.type)
        self.writers = showDB.writers ?? []
        self.year = Int(showDB.year)
        self.fastVodEnabled = showDB.fastVodEnabled
        self.url = showDB.url ?? ""
        self.startBookmark = Int(showDB.startBookmark)
        self.id = showDB.id ?? ""
        self.score = showDB.score
        self.channelPremium = showDB.channelPremium
    }
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
    let photo: String?
    let poster: String?
    let background: String?
    
    init(photo: String?, poster: String?, background: String?) {
        self.photo = photo
        self.poster = poster
        self.background = background
    }
    
    init(_ moviePictureDB: MoviePicturesDB){
        self.photo = moviePictureDB.photo
        self.poster = moviePictureDB.poster
        self.background = moviePictureDB.background
    }
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
