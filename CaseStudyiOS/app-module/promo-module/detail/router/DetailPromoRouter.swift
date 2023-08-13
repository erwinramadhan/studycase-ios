//
//  DetailPromoRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 11/08/23.
//

import Foundation

class DetailPromoRouter: DetailPromoPresenterToRouterProtocol {
    static func createModule(detailPromoId: Int?) -> DetailPromoViewController {
        let view: DetailPromoViewController = DetailPromoViewController()
        let interactor: DetailPromoPresenterToInteractorProtocol = DetailPromoInteractor()
        let presenter: DetailPromoViewToPresenterProtocol & DetailPromoInteractorToPresenterProtocol = DetailPromoPresenter()
        let router: DetailPromoPresenterToRouterProtocol = DetailPromoRouter()
        
        presenter.detailPromoId = detailPromoId
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}
