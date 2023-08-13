//
//  QRISProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

protocol QRISPresenterToViewProtocol: AnyObject {
    
}

protocol QRISPresenterToInteractorProtocol: AnyObject {
    var presenter: QRISInteractorToPresenterProtocol? { get set }
}

protocol QRISViewToPresenterProtocol: AnyObject {
    var view: QRISPresenterToViewProtocol? { get set }
    var interactor: QRISPresenterToInteractorProtocol? { get set }
    var router: QRISPresenterToRouterProtocol? { get set }
}

protocol QRISInteractorToPresenterProtocol: AnyObject {
    
}

protocol QRISPresenterToRouterProtocol: AnyObject {
    static func createModule() -> QRISViewController
}
