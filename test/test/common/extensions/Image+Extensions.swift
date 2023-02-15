//
//  Image+Extensions.swift
//  test
//
//  Created by Cristian Contreras on 15/2/23.
//

import Foundation
import Rswift
import SwiftUI

public extension Image {
    init(imageResource: ImageResource) {
        self.init(imageResource.name, bundle: imageResource.bundle)
    }
}
