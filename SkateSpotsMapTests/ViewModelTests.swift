//
//  ViewModelTests.swift
//  SkateSpotsMapTests
//
//  Created by Daniel Johann Arriola on 12/5/23.
//

import XCTest
@testable import SkateSpotsMap

final class ViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        var changeling = SkateSpot.example3
        changeling.id = "spot1"
        XCTAssert(SkateSpot.example != SkateSpot.example2)
        XCTAssert(SkateSpot.example != SkateSpot.example3)
        XCTAssert(SkateSpot.example2 != SkateSpot.example3)
        XCTAssert(SkateSpot.example == SkateSpot.example)
        XCTAssert(SkateSpot.example == changeling)
        changeling.id = nil
        XCTAssert(SkateSpot.example3 == changeling)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
