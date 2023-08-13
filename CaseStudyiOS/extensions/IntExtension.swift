//
//  IntExtension.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

extension Int {
    func formatToRupiah() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        
        if let formattedString = formatter.string(from: NSNumber(value: self)) {
            return formattedString
        }
        
        return nil
    }
}
