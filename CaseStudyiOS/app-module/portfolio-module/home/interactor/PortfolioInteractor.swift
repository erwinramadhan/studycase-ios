//
//  PortfolioInteractor.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 12/08/23.
//

import Foundation

class PortfolioInteractor: PortfolioPresenterToInteractorProtocol {
    var presenter: PortfolioInteractorToPresenterProtocol?
    
    func fetchDonutChart() {
        let response = DonutChartResponse(
            type: "donutChart",
            data: [
                DataDonut(
                    label: "Tarik Tunai",
                    percentage: "55",
                    data: [
                        TransactionHistory(transactionDate: "21/01/2023", nominal: 1000000),
                        TransactionHistory(transactionDate: "21/01/2023", nominal: 500000),
                        TransactionHistory(transactionDate: "19/01/2023", nominal: 1000000)
                    ]
                ),
                DataDonut(
                    label: "QRIS Payment",
                    percentage: "31",
                    data: [
                        TransactionHistory(transactionDate: "21/01/2023", nominal: 159000),
                        TransactionHistory(transactionDate: "20/01/2023", nominal: 35000),
                        TransactionHistory(transactionDate: "19/01/2023", nominal: 1500)
                    ]
                ),
                DataDonut(
                    label: "Topup Gopay",
                    percentage: "7.7",
                    data: [
                        TransactionHistory(transactionDate: "21/01/2023", nominal: 200000),
                        TransactionHistory(transactionDate: "20/01/2023", nominal: 195000),
                        TransactionHistory(transactionDate: "19/01/2023", nominal: 5000000)
                    ]
                ),
                DataDonut(
                    label: "Lainnya",
                    percentage: "6.3",
                    data: [
                        TransactionHistory(transactionDate: "21/01/2023", nominal: 1000000),
                        TransactionHistory(transactionDate: "20/01/2023", nominal: 500000),
                        TransactionHistory(transactionDate: "19/01/2023", nominal: 1000000)
                    ]
                )
            ]
        )
        presenter?.donutChartFetchedSucces(donutChartData: response)
    }
    
    func fetchLineChart() {
        
    }
}
