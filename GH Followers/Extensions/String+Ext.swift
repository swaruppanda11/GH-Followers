//
//  String+Ext.swift
//  GH Followers
//
//  Created by Swarup Panda on 05/07/24.
//

import Foundation

extension String {
    
    func ConvertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
        
    }
    
    func ConvertToDisplayFormat() -> String {
        guard let date = self.ConvertToDate() else {
            return "N/A"
        }
        return date.ConvertToMonthYearFormat()
    }
}
