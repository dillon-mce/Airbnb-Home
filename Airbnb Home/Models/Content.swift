//
//  Content.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import UIKit

struct Content: Hashable {
    enum Style {
        case standard, title
    }
    let title: String
    let subtitle: String?
    let image: String?
    let style: Style

    init(title: String, subtitle: String?, image: String?, style: Style = .standard) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.style = style
    }
}

// MARK: - Headers
//
//extension Section {
//    var headerContent: Content? {
//        switch self {
//        case .nearby: return nil
//        case .stays: return .init(title: "Live anywhere", subtitle: nil, image: nil)
//        case .experiences: return .init(title: "Experience the world",
//                                  subtitle: "Unique activities with local experts—in person or online.",
//                                  image: nil)
//        case .hosting: return .init(title: "Join millions of hosts on Airbnb", subtitle: nil, image: nil)
//        case .info: return .init(title: "Stay informed", subtitle: nil, image: nil)
//        }
//    }
//}

// MARK: - Stub Data
//
//extension Section {
//    func stubData() -> [Content] {
//        switch self {
//        case .nearby:
//            return [
//                .init(title: "Estes Park", subtitle: "1.5 hour drive", image: "estes-park"),
//                .init(title: "Breckenridge", subtitle: "2.5 hour drive", image: "breckenridge"),
//                .init(title: "Grand Lake", subtitle: "3 hour drive", image: "grand-lake"),
//                .init(title: "Idaho Springs", subtitle: "2 hour drive", image: "idaho-springs"),
//                .init(title: "Glenwood Springs", subtitle: "4.5 hour drive", image: "glenwood-springs"),
//                .init(title: "Pagosa Springs", subtitle: "7.5 hour drive", image: "pagosa-springs"),
//            ]
//        case .stays:
//            return [
//                .init(title: "Entire homes", subtitle: nil, image: "entire-homes"),
//                .init(title: "Cabins and cottages", subtitle: nil, image: "cabins-cottages"),
//                .init(title: "Unique stays", subtitle: nil, image: "unique-stays"),
//                .init(title: "Pets welcome", subtitle: nil, image: "pets-welcome"),
//            ]
//        case .experiences:
//            return [
//                .init(title: "Online Experiences",
//                      subtitle: "Travel the world without leaving home.",
//                      image: "online-experiences"),
//                .init(title: "Experiences",
//                      subtitle: "Things to do wherever you are.",
//                      image: "experiences"),
//                .init(title: "Adventures",
//                      subtitle: "Multi-day trips with meals and stays.",
//                      image: "adventures"),
//            ]
//        case .hosting:
//            return [
//                .init(title: "Host your home", subtitle: nil, image: "host-your-home"),
//                .init(title: "Host an Online Experience", subtitle: nil, image: "host-online-experience"),
//                .init(title: "Host an Experience", subtitle: nil, image: "host-experience"),
//            ]
//        case .info:
//            return [
//                .init(title: "For guests", subtitle: nil, image: nil, style: .title),
//                .init(title: "Our COVID-19 response", subtitle: "Health and saftey updates", image: nil),
//                .init(title: "Cancellation options", subtitle: "Learn what's covered", image: nil),
//                .init(title: "Help Center", subtitle: "Get support", image: nil),
//
//                .init(title: "For hosts", subtitle: nil, image: nil, style: .title),
//                .init(title: "Message from Brian Chesky", subtitle: "Hear from our CEO", image: nil),
//                .init(title: "Resources for hosting", subtitle: "What's impacted by COVID-19", image: nil),
//                .init(title: "Providing frontline stays", subtitle: "Learn how to help", image: nil),
//
//                .init(title: "For COVID-19 responders", subtitle: nil, image: nil, style: .title),
//                .init(title: "Frontline stays", subtitle: "Learn about our program", image: nil),
//                .init(title: "Sign up", subtitle: "Check for housing options", image: nil),
//                .init(title: "Make a donation", subtitle: "Support nonprofit organizations", image: nil),
//
//                .init(title: "More", subtitle: nil, image: nil, style: .title),
//                .init(title: "Airbnb Newsroom", subtitle: "Latest announcements", image: nil),
//                .init(title: "World Health Organization", subtitle: "Education and updates", image: nil),
//                .init(title: "Project Lighthouse", subtitle: "Finding and fighting discrimination", image: nil),
//            ]
//        }
//    }
//}
