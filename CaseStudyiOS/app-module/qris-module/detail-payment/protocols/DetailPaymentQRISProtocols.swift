//
//  DetailPaymentQRISProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

protocol DetailPaymentQRISPresenterToViewProtocol: AnyObject {
    
}

protocol DetailPaymentQRISPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailPaymentQRISInteractorToPresenterProtocol? { get set }
}

protocol DetailPaymentQRISViewToPresenterProtocol: AnyObject {
    var view: DetailPaymentQRISPresenterToViewProtocol? { get set }
    var interactor: DetailPaymentQRISPresenterToInteractorProtocol? { get set }
    var router: DetailPaymentQRISPresenterToRouterProtocol? { get set }
    
    var qrisData: QRISData? { get set }
}

protocol DetailPaymentQRISInteractorToPresenterProtocol: AnyObject {
    
}

protocol DetailPaymentQRISPresenterToRouterProtocol: AnyObject {
    static func createModule(qrisData: QRISData) -> DetailPaymentQRISViewController
}
