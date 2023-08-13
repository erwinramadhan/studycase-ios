//
//  PaymentSuccessQRISPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class PaymentSuccessQRISPresenter: PaymentSuccessQRISViewToPresenterProtocol {
    var view: PaymentSuccessQRISPresenterToViewProtocol?
    var interactor: PaymentSuccessQRISPresenterToInteractorProtocol?
    var router: PaymentSuccessQRISPresenterToRouterProtocol?
    
    var qrisData: QRISData?
}

extension PaymentSuccessQRISPresenter: PaymentSuccessQRISInteractorToPresenterProtocol {
    
}
