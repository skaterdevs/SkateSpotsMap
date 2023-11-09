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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let skateSpotRepo = SkateSpotRepository()
            print("Number of Documents: \(skateSpotRepo.skate_spots.count)")
            print(skateSpotRepo.skate_spots)
            XCTAssert(skateSpotRepo.skate_spots.count != 0)
        }
    }
}
