//
//  
//  HomeNavigationLink.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//
//  Created by Christian Contreras
//
import Foundation
protocol IHomeNavigationLink: Identifiable {
    var navigationLink: HomeNavigationLink { get }
    var sheetItem: HomeNavigationLink? { get }
}

enum HomeNavigationLink: Hashable, IHomeNavigationLink {
    case goToDetail(id: String? = nil)
    
    var id: String {
        switch self {
        case let .goToDetail(id):
            return "goToDeatil: " + (id ?? "")
        }
    }
    
    var navigationLink: HomeNavigationLink {
        switch self {
        default:
            return .goToDetail()
        }
    }
    
    var sheetItem: HomeNavigationLink? {
        return nil
    }
}
