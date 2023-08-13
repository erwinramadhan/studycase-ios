//
//  QRISRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class QRISRouter: QRISPresenterToRouterProtocol {
    static func createModule() -> QRISViewController {
        let view: QRISPresenterToViewProtocol & QRISViewController = QRISViewController()
        let interactor: QRISPresenterToInteractorProtocol = QRISInteractor()
        let presenter: QRISViewToPresenterProtocol & QRISInteractorToPresenterProtocol = QRISPresenter()
        let router: QRISPresenterToRouterProtocol = QRISRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
}
