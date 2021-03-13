//
//  UIFont+Custom.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import UIKit

extension UIFont {
    private static var largeTitle: UIFont {
        return UIFontMetrics(forTextStyle: .largeTitle)
            .scaledFont(for: .systemFont(ofSize: 64, weight: .heavy))
    }

    private static var headline: UIFont {
        UIFontMetrics(forTextStyle: .headline)
            .scaledFont(for: .systemFont(ofSize: 14, weight: .semibold))
    }

    private static var subheadline: UIFont {
        UIFontMetrics(forTextStyle: .subheadline)
            .scaledFont(for: .systemFont(ofSize: 12, weight: .light))
    }

    private static var title2: UIFont {
        UIFontMetrics(forTextStyle: .title2)
            .scaledFont(for: .systemFont(ofSize: 18, weight: .bold))
    }

    private static var title4: UIFont {
        UIFontMetrics(forTextStyle: .title3)
            .scaledFont(for: .systemFont(ofSize: 15, weight: .light))
    }

    private static var button: UIFont {
        UIFontMetrics(forTextStyle: .headline)
            .scaledFont(for: .systemFont(ofSize: 13, weight: .semibold))
    }
}

extension UIFont {
    enum Style {
        case largeTitle
        case title2
        case title4
        case button
        case headline
        case subheadline
    }

    static func custom(style: Style) -> UIFont {
        switch style {
        case .largeTitle: return largeTitle
        case .title2: return title2
        case .title4: return title4
        case .button: return button
        case .headline: return headline
        case .subheadline: return subheadline
        }
    }
}
