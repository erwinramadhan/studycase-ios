//
//  DetailPaymentQRISPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class DetailPaymentQRISPresenter: DetailPaymentQRISViewToPresenterProtocol {
    var view: DetailPaymentQRISPresenterToViewProtocol?
    var interactor: DetailPaymentQRISPresenterToInteractorProtocol?
    var router: DetailPaymentQRISPresenterToRouterProtocol?
    
    var qrisData: QRISData?
}

extension DetailPaymentQRISPresenter: DetailPaymentQRISInteractorToPresenterProtocol {
    
}
