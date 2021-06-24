//
//  GameTests.swift
//  PairsTests
//
//  Created by Paul Richardson on 24/06/2021.
//

import XCTest
@testable import Pairs

class GameTests: XCTestCase {
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testGame_PairsCount_EqualsAlphabetCountTimesTwo() throws {
		// Arrange
		let sut = Game()
		let greek = sut.greek
		let pairs = sut.pairs
		
		// Act
		let expectedLength = greek.count * 2
		let pairsCount = pairs.count
		
		// Assert
		XCTAssertTrue(pairsCount == expectedLength, "Length of pairs should be \(expectedLength), but is \(pairsCount)" )
	}
	
}
