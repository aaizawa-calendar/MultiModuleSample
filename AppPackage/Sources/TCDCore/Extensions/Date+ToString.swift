//
//  Date+ToString.swift
//
//
//  Created by aizawa on 2024/10/01.
//

import Foundation

public extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter.defaultFormatter
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
