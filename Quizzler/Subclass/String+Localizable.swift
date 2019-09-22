//
//  String+Localizable.swift
//  Quizzler
//
//  Created by mini03 on 9/21/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
