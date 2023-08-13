//
//  PortfolioRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 12/08/23.
//

import Foundation

class PortfolioRouter: PortfolioPresenterToRouterProtocol {
    static func createModule() -> PortfolioViewController {
        let view: PortfolioViewController = PortfolioViewController()
        let interactor: PortfolioPresenterToInteractorProtocol = PortfolioInteractor()
        let presenter: PortfolioViewToPresenterProtocol & PortfolioInteractorToPresenterProtocol = PortfolioPresenter()
        let router: PortfolioPresenterToRouterProtocol = PortfolioRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}
