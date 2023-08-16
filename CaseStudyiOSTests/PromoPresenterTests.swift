//
//  PromoPresenterTests.swift
//  CaseStudyiOSTests
//
//  Created by Erwin Ramadhan on 16/08/23.
//

import XCTest
@testable import CaseStudyiOS

final class PromoPresenterTests: XCTestCase {
    var sut: PromoPresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PromoPresenter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetPromo() throws {
        sut.getPromo()
        XCTAssertTrue(sut.isLoading == true)
    }
    
    func testPromoFetchedSuccess() throws {
        let promos = [PromoResponse(
            id: 1,
            name: "Promo QRIS",
            description: "Promo QRIS 17 Agustus",
            latitude: "0.0",
            longitude: "0.0",
            location: "Jakarta",
            count: 40,
            image: PromoImage(id: 1, name: "promoqris.jpg", url: "https://pbs.twimg.com/media/Ep7EkhgVEAEWs7p?format=jpg&name=large")
        )]
        
        sut.isLoading = true
        sut.promoFetchedSuccess(promos: promos)
        
        XCTAssertTrue(sut.isLoading == false)
        XCTAssertEqual(sut.isLoading, false, "When is success isLoading its should be false")
        XCTAssertNotEqual(sut.isLoading, true, "When is success isLoading should be not equal true")
    }
    
    func testPromoFetchFailed() throws {
        sut.isLoading = true
        sut.promoFetchFailed()
        
        XCTAssertTrue(sut.isLoading == false)
        XCTAssertEqual(sut.isLoading, false, "When is success isLoading its should be false")
        XCTAssertNotEqual(sut.isLoading, true, "When is success isLoading should be not equal true")
    }
    
}
