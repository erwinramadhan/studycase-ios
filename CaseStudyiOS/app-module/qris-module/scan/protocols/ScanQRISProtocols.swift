//
//  ScanQRISProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

protocol ScanQRISPresenterToViewProtocol: AnyObject {
    
}

protocol ScanQRISPresenterToInteractorProtocol: AnyObject {
    var presenter: ScanQRISInteractorToPresenterProtocol? { get set }
}

protocol ScanQRISViewToPresenterProtocol: AnyObject {
    var view: ScanQRISPresenterToViewProtocol? { get set }
    var interactor: ScanQRISPresenterToInteractorProtocol? { get set }
    var router: ScanQRISPresenterToRouterProtocol? { get set }
}

protocol ScanQRISInteractorToPresenterProtocol: AnyObject {
    
}

protocol ScanQRISPresenterToRouterProtocol: AnyObject {
    static func createModule() -> ScanQRISViewController
}
