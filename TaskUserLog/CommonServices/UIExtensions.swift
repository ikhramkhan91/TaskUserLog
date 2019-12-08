//
//  AppDelegate.swift
//  TaskUserLog
//
//  Created by Ikhram Khan on 12/7/19.
//  Copyright © 2019 IkhramDev. All rights reserved.
//

import UIKit

public extension String {
    var isEmail: Bool {
        return matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    }
    func matches(pattern: String) -> Bool {
        return range(of: pattern,
                     options: String.CompareOptions.regularExpression,
                     range: nil, locale: nil) != nil
    }
}


