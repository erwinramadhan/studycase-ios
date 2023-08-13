//
//  PromoRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 09/08/23.
//

import Foundation

class PromoRouter: PromoPresenterToRouterProtocol {
    static func createModule() -> PromoViewController {
        
        let view: PromoViewController = PromoViewController()
        let interactor: PromoPresenterToInteractorProtocol = PromoInteractor()
        let presenter: PromoViewToPresenterProtocol & PromoInteractorToPresenterProtocol = PromoPresenter()
        let router: PromoPresenterToRouterProtocol = PromoRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}
