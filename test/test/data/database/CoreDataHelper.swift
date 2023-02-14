//
//  CoreDataHelper.swift
//  test
//
//  Created by Cristian Contreras on 14/2/23.
//

import UIKit
import CoreData

struct CoreDataHelper {
    private static let context: NSManagedObjectContext = {
        let persistentContainer = AppDelegate.instance.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func saveShow(show: ShowDTO) -> Bool {
        guard let showDB = NSEntityDescription.insertNewObject(forEntityName: "ShowDB", into: context) as? ShowDB else {
            return false
        }
        
        showDB.actors = show.actors
        showDB.ageCode = show.ageCode.rawValue
        showDB.channelPremium = show.channelPremium ?? false
        showDB.beginTime = show.beginTime
        showDB.catchup = show.catchup
        showDB.channel = show.channel
        showDB.channelName = show.channelName
        showDB.country = show.country
        showDB.directors = show.directors
        showDB.endTime = show.endTime
        showDB.episodeTitle = show.episodeTitle
        showDB.eventId = show.eventId
        showDB.fastVodEnabled = show.fastVodEnabled ?? false
        showDB.id = show.id
        showDB.kind = show.kind.rawValue
        showDB.language = show.language.rawValue
        showDB.length = Int64(show.length)
        showDB.programId = show.programId
        showDB.score = show.score
        showDB.seasonId = show.seasonId
        showDB.serieId = show.serieId
        if let startBookmark = show.startBookmark {
            showDB.startBookmark = Int64(startBookmark)
        }
        showDB.synopsis = show.synopsis
        showDB.synopsisEpisode = show.synopsisEpisode
        showDB.synopsisLong = show.synopsisLong
        showDB.tags = show.tags.map({ $0.rawValue })
        showDB.title = show.title
        showDB.type = Int64(show.type)
        showDB.url = show.url
        showDB.writers = show.writers
        showDB.year = Int64(show.year)        
        
        do {
            try context.save()
        } catch {
            return false
        }
        return true
    }
}
