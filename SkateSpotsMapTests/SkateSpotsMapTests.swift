//
//  SkateSpotsMapTests.swift
//  SkateSpotsMapTests
//
//  Created by Jason on 11/2/23.
//

import XCTest
@testable import SkateSpotsMap

final class SkateSpotsMapTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    // MARK: SkateSpotRepository Testing
    func testSkateSpotRepositoryInit() {
        let skateSpotRepo = SkateSpotRepository()
        print("Number of Documents:", skateSpotRepo.skate_spots.count)
        XCTAssert(skateSpotRepo.skate_spots.count != 0)
    }

}
