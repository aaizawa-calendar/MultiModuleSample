//
//  DateFormatter+Default.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import Foundation

public extension DateFormatter {
    static var defaultFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }
}

