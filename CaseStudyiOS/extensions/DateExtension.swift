//
//  DateExtension.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func greeting() -> String {
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: self)
        
        if (5..<12).contains(currentHour) {
            return "Good morning, "
        } else if (12..<18).contains(currentHour) {
            return "Good afternoon, "
        } else {
            return "Good evening, "
        }
    }
}
