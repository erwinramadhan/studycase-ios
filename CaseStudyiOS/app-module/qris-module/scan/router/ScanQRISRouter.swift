//
//  ScanQRISRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class ScanQRISRouter: ScanQRISPresenterToRouterProtocol {
    static func createModule() -> ScanQRISViewController {
        let view: ScanQRISViewController & ScanQRISPresenterToViewProtocol = ScanQRISViewController()
        let interactor: ScanQRISPresenterToInteractorProtocol = ScanQRISInteractor()
        let presenter: ScanQRISViewToPresenterProtocol & ScanQRISInteractorToPresenterProtocol = ScanQRISPresenter()
        let router: ScanQRISPresenterToRouterProtocol = ScanQRISRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}
