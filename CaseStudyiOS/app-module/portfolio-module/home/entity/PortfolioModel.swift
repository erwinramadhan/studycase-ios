//
//  PortfolioModel.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 12/08/23.
//

import Foundation

struct TransactionHistory {
    var transactionDate: String
    var nominal: Int
}

struct DataDonut {
    var label: String
    var percentage: String
    var data: [TransactionHistory]
}

struct DonutChartResponse {
    var type: String
    var data: [DataDonut]
}

struct DataLine {
    var month: [Int]
}

struct LineChartResponse {
    var type: String
    var data: DataLine
}
