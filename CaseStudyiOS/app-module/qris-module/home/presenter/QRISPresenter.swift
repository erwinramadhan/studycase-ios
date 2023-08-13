//
//  QRISPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class QRISPresenter: QRISViewToPresenterProtocol {
    var view: QRISPresenterToViewProtocol?
    var interactor: QRISPresenterToInteractorProtocol?
    var router: QRISPresenterToRouterProtocol?
}

extension QRISPresenter: QRISInteractorToPresenterProtocol {
    
}
