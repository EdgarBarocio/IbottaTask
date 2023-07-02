//
//  OffersModelTests.swift
//  IbottaAppTests
//
//  Created by Edgar Barocio on 7/2/23.
//

import XCTest
@testable import IbottaApp

final class OffersModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOffersModelInitialization_ValuesShouldMatch_IsFavoriteDetaulstToFalse() throws {
        let sut = OffersModel(id: "1",
                              url: "www",
                              name: "OfferName",
                              description: "OfferDescription",
                              terms: "OfferTerms",
                              currentValue: "OfferValue")
        
        XCTAssertNotNil(sut.id, "Id Should not be nil")
        XCTAssertNotNil(sut.url, "Url Should not be nil")
        XCTAssertNotNil(sut.name, "Name Should not be nil")
        XCTAssertNotNil(sut.description, "Description Should not be nil")
        XCTAssertNotNil(sut.terms, "Terms Should not be nil")
        XCTAssertNotNil(sut.currentValue, "CurrentValue Should not be nil")
        if let boolValue = sut.isFavorite {
            XCTAssertFalse(boolValue, "isFavorite should default to False")
        } else {
            XCTFail("isFavorite should have a value")
        }
    }

    func testOffersModelInitialization_ValuesShouldMatch_IsFavoriteDetaulstToTrue() throws {
        let sut = OffersModel(id: "1",
                              url: "www",
                              name: "OfferName",
                              description: "OfferDescription",
                              terms: "OfferTerms",
                              currentValue: "OfferValue",
                              isFavorite: true)
        
        XCTAssertNotNil(sut.id, "Id Should not be nil")
        XCTAssertNotNil(sut.url, "Url Should not be nil")
        XCTAssertNotNil(sut.name, "Name Should not be nil")
        XCTAssertNotNil(sut.description, "Description Should not be nil")
        XCTAssertNotNil(sut.terms, "Terms Should not be nil")
        XCTAssertNotNil(sut.currentValue, "CurrentValue Should not be nil")
        if let boolValue = sut.isFavorite {
            XCTAssertTrue(boolValue, "isFavorite should be True")
        } else {
            XCTFail("isFavorite should have a value")
        }
    }
}
