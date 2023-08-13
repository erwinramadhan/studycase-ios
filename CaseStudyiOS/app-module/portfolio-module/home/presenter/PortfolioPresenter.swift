//
//  PortfolioPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 12/08/23.
//

import Foundation

class PortfolioPresenter: PortfolioViewToPresenterProtocol {
    var view: PortfolioPresenterToViewProtocol?
    var interactor: PortfolioPresenterToInteractorProtocol?
    var router: PortfolioPresenterToRouterProtocol?
    
    var isDonutChartLoading: Bool = false
    var isLineChartLoading: Bool = false
    
    var donutChartData: DonutChartResponse?
    
    func getDonutChart() {
        isDonutChartLoading = true
        interactor?.fetchDonutChart()
    }
    
    func getLineChart() {
        isLineChartLoading = true
        interactor?.fetchLineChart()
    }
}

extension PortfolioPresenter: PortfolioInteractorToPresenterProtocol {
    func donutChartFetchedSucces(donutChartData: DonutChartResponse) {
        self.donutChartData = donutChartData
        view?.showDonutChart(donutChartData: donutChartData)
    }
    
    func donutChartFetchFailed() {
        view?.showDonutChartError()
    }
    
    func lineChartFetchedSuccess(lineChartData: LineChartResponse) {
        view?.showLineChart(lineChartData: lineChartData)
    }
    
    func lineChartFetchFailed() {
        view?.showLineChartError()
    }
}
