//
//  String+ToDate.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import Foundation

public extension String {
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter.defaultFormatter
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
