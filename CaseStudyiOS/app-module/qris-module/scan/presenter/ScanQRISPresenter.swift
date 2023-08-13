//
//  ScanQRISPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class ScanQRISPresenter: ScanQRISViewToPresenterProtocol {
    var view: ScanQRISPresenterToViewProtocol?
    var interactor: ScanQRISPresenterToInteractorProtocol?
    var router: ScanQRISPresenterToRouterProtocol?
}

extension ScanQRISPresenter: ScanQRISInteractorToPresenterProtocol {
    
}
