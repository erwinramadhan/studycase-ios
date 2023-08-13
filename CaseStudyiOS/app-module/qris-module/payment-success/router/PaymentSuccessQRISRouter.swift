//
//  PaymentSuccessQRISRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class PaymentSuccessQRISRouter: PaymentSuccessQRISPresenterToRouterProtocol {
    static func createModule(qrisData: QRISData) -> PaymentSuccessQRISViewController {
        let view: PaymentSuccessQRISViewController & PaymentSuccessQRISPresenterToViewProtocol = PaymentSuccessQRISViewController()
        let interactor: PaymentSuccessQRISPresenterToInteractorProtocol = PaymentSuccessQRISInteractor()
        let presenter: PaymentSuccessQRISViewToPresenterProtocol & PaymentSuccessQRISInteractorToPresenterProtocol = PaymentSuccessQRISPresenter()
        let router: PaymentSuccessQRISPresenterToRouterProtocol = PaymentSuccessQRISRouter()
        
        presenter.qrisData = qrisData
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}
