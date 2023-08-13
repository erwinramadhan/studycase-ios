//
//  PaymentSuccessQRISProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

protocol PaymentSuccessQRISPresenterToViewProtocol: AnyObject {
    
}

protocol PaymentSuccessQRISPresenterToInteractorProtocol: AnyObject {
    var presenter: PaymentSuccessQRISInteractorToPresenterProtocol? { get set }
}

protocol PaymentSuccessQRISViewToPresenterProtocol: AnyObject {
    var view: PaymentSuccessQRISPresenterToViewProtocol? { get set }
    var interactor: PaymentSuccessQRISPresenterToInteractorProtocol? { get set }
    var router: PaymentSuccessQRISPresenterToRouterProtocol? { get set }
    
    var qrisData: QRISData? { get set }
}

protocol PaymentSuccessQRISInteractorToPresenterProtocol: AnyObject {
    
}

protocol PaymentSuccessQRISPresenterToRouterProtocol: AnyObject {
    static func createModule(qrisData: QRISData) -> PaymentSuccessQRISViewController
}
