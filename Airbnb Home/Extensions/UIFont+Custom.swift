//
//  UIFont+Custom.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import UIKit

extension UIFont {
    private static var headline: UIFont {
        UIFontMetrics(forTextStyle: .headline)
            .scaledFont(for: .systemFont(ofSize: 14, weight: .semibold))
    }

    private static var subheadline: UIFont {
        UIFontMetrics(forTextStyle: .subheadline)
            .scaledFont(for: .systemFont(ofSize: 12, weight: .light))
    }
}

extension UIFont {
    enum Style {
        case headline
        case subheadline
    }

    static func custom(style: Style) -> UIFont {
        switch style {
        case .headline: return headline
        case .subheadline: return subheadline
        }
    }
}
