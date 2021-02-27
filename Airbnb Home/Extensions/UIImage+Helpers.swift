//
//  UIImage+Helpers.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import UIKit

extension UIImage {
    convenience init?(named name: String?) {
        guard let name = name else { return nil }
        self.init(named: name)
    }
}
