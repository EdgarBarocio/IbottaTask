//
//  OffersCollectionViewCellViewModelTests.swift
//  IbottaAppTests
//
//  Created by Edgar Barocio on 7/2/23.
//

import XCTest
@testable import IbottaApp

final class OffersCollectionViewCellViewModelTests: XCTestCase {

    var sut:OffersCollectionViewCellViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = OffersCollectionViewCellViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testOffersCollectionViewCellViewModelInitializer_valuesShouldMatch() throws {
        sut = OffersCollectionViewCellViewModel(url: "testURL",
                                                name: "testName",
                                                value: "testValue",
                                                isFavorite: false)
        
        XCTAssertNotNil(sut?.url, "URL Should not be nil")
        XCTAssertNotNil(sut?.name, "Name Should not be nil")
        XCTAssertNotNil(sut?.value, "Value Should not be nil")
        if let falseValue = sut?.isFavorite {
            XCTAssertFalse(falseValue, "isFavorite should default to False")
        } else {
            XCTFail("isFavorite should have a value")
        }
        
        let sut2 = OffersCollectionViewCellViewModel(url: "testURL",
                                                     name: "testName",
                                                     value: "testValue",
                                                     isFavorite: true)
        
        XCTAssertNotNil(sut2.url, "URL Should not be nil")
        XCTAssertNotNil(sut2.name, "Name Should not be nil")
        XCTAssertNotNil(sut2.value, "Value Should not be nil")
        if let trueValue = sut2.isFavorite {
            XCTAssertTrue(trueValue, "isFavorite should be True")
        } else {
            XCTFail("isFavorite should have a value")
        }
    }
}
