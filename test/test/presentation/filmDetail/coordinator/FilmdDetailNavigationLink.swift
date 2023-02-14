//
//  
//  FilmdDetailNavigationLink.swift
//  test
//
//  Created by Cristian Contreras on 14/2/23.
//
//  Created by Christian Contreras
//
import Foundation
protocol IFilmdDetailNavigationLink: Identifiable {
    var navigationLink: FilmdDetailNavigationLink { get }
    var sheetItem: FilmdDetailNavigationLink? { get }
}

enum FilmdDetailNavigationLink: Hashable, IFilmdDetailNavigationLink {
    // EXAMPLE
    case goToPage(id: Int? = nil)
    
    var id: String {
        switch self {
        case let .goToPage(id):
            return "goToInfo: \(id ?? 0)"
        }
    }
    
    var navigationLink: FilmdDetailNavigationLink {
        switch self {
        default:
            return .goToPage()
        }
    }
    
    var sheetItem: FilmdDetailNavigationLink? {
        return nil
    }
}
