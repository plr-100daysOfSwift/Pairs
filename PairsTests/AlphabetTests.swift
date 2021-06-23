//
//  AlphabetTests.swift
//  PairsTests
//
//  Created by Paul Richardson on 24/06/2021.
//

import XCTest
@testable import Pairs

class AlphabetTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAlphabet_WhenNameIsAlpha_UppercaseIsΑ() throws {
			// Arrange
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let sut = storyboard.instantiateViewController(identifier: "ViewController") as ViewController

			// Act
			if let alpha = sut.greek["alpha"] {
				// Assert
				XCTAssertTrue(alpha.upper == "Α", "Expected Α but found \(alpha.upper)")
			}

		}

}
