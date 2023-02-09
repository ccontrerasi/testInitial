//
//  ErrorPopupModel.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//

import Foundation

struct ErrorPopupModel {
    let title: String
    let description: String
    let gifName: String?
    let actionTitle: String
    let actionCallback: (() -> Void)?
    
    init(
        title: String = "Error",
        description: String,
        gifName: String? = "",
        actionTitle: String = "Aceptar",
        actionCallback: (() -> Void)? = nil
    ) {
        self.title = title
        self.description = description
        self.gifName = gifName
        self.actionTitle = actionTitle
        self.actionCallback = actionCallback
    }
}

