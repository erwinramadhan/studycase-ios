//
//  DetailPaymentQRISRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class DetailPaymentQRISRouter: DetailPaymentQRISPresenterToRouterProtocol {
    static func createModule(qrisData: QRISData) -> DetailPaymentQRISViewController {
        let view: DetailPaymentQRISPresenterToViewProtocol & DetailPaymentQRISViewController = DetailPaymentQRISViewController()
        let interactor: DetailPaymentQRISPresenterToInteractorProtocol = DetailPaymentQRISInteractor()
        let presenter: DetailPaymentQRISViewToPresenterProtocol & DetailPaymentQRISInteractorToPresenterProtocol = DetailPaymentQRISPresenter()
        let router: DetailPaymentQRISPresenterToRouterProtocol = DetailPaymentQRISRouter()
        
        presenter.qrisData = qrisData
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
}
