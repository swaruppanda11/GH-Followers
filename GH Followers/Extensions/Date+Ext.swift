//
//  File.swift
//  GH Followers
//
//  Created by Swarup Panda on 05/07/24.
//

import Foundation

extension Date {
    
    func ConvertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
