//
//  DetailPortfolioRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 14/08/23.
//

import Foundation

class DetailPortfolioRouter: DetailPortfolioPresenterToRouterProtocol {
    static func createModule(dataDonut: DataDonut) -> DetailPortfolioViewController {
        let view: DetailPortfolioViewController & DetailPortfolioPresenterToViewProtocol = DetailPortfolioViewController()
        let presenter: DetailPortfolioViewToPresenterProtocol & DetailPortfolioInteractorToPresenter = DetailPortfolioPresenter()
        let interactor: DetailPortfolioPresenterToInteractorProtocol = DetailPortfolioInteractor()
        let router: DetailPortfolioPresenterToRouterProtocol = DetailPortfolioRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.dataDonut = dataDonut
        interactor.presenter = presenter
        
        return view
    }
}
