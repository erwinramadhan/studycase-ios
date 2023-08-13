//
//  DetailPaymentModel.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

struct HistoryTransaction: Codable {
    var type: TransactionType
    var bankName: String
    var transactionId: String
    var merchantName: String
    var amount: Int
    var date: Date
    
    enum TransactionType: String, Codable {
        case credit
        case debit
    }
}
