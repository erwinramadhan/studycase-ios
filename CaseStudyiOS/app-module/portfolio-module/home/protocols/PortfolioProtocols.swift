//
//  PortfolioProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 12/08/23.
//

import Foundation

protocol PortfolioPresenterToViewProtocol: AnyObject {
    func showDonutChart(donutChartData: DonutChartResponse)
    func showDonutChartError()
    func showLineChart(lineChartData: LineChartResponse)
    func showLineChartError()
}

protocol PortfolioViewToPresenterProtocol: AnyObject {
    var view: PortfolioPresenterToViewProtocol? { get set }
    var interactor: PortfolioPresenterToInteractorProtocol? { get set }
    var router: PortfolioPresenterToRouterProtocol? { get set }
    
    var donutChartData: DonutChartResponse? { get set }
    
    var isDonutChartLoading: Bool { get set }
    var isLineChartLoading: Bool { get set }
    
    func getDonutChart()
    func getLineChart()
}

protocol PortfolioInteractorToPresenterProtocol: AnyObject {
    func donutChartFetchedSucces(donutChartData: DonutChartResponse)
    func donutChartFetchFailed()
    func lineChartFetchedSuccess(lineChartData: LineChartResponse)
    func lineChartFetchFailed()
}

protocol PortfolioPresenterToInteractorProtocol: AnyObject {
    var presenter: PortfolioInteractorToPresenterProtocol? { get set }
    
    func fetchDonutChart()
    func fetchLineChart()
}

protocol PortfolioPresenterToRouterProtocol: AnyObject {
    static func createModule() -> PortfolioViewController
}

