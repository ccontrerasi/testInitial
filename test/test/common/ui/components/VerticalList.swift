//
//  VerticalList.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//

import Foundation
import SwiftUI

public struct VerticalList<Content: View>: View {
    private let content: Content
    private let alignment: HorizontalAlignment
    private let spacing: CGFloat?

    public init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
        ScrollView {
            LazyVStack(alignment: alignment, spacing: spacing) { content }
        }
    }
}
