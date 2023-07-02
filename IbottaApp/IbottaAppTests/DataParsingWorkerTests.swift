//
//  DataParsingWorkerTests.swift
//  IbottaAppTests
//
//  Created by Edgar Barocio on 7/2/23.
//

import XCTest
@testable import IbottaApp

final class DataParsingWorkerTests: XCTestCase {

    var sut:DataParsingWorker?
    
    override func setUpWithError() throws {
        sut = DataParsingWorker()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        let response  = sut?.parseJSONFromFile()
        
        XCTAssertNotNil(response, "Response should have data")
    }
}
