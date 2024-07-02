//
//  File.swift
//  
//
//  Created by 周源坤 on 2024/7/2.
//

import Foundation

extension Date {
    func localDateString(dateFormat: String, timezone: TimeZone) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = timezone
        return dateFormatter.string(from: self)
    }
}

