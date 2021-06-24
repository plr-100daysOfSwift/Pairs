//
//  GameTests.swift
//  PairsTests
//
//  Created by Paul Richardson on 24/06/2021.
//

import XCTest
@testable import Pairs

class GameTests: XCTestCase {

	var sut: Game!
	var alphabet: Alphabet!

	override func setUpWithError() throws {
		sut = Game()
		alphabet = sut.greek
	}

	override func tearDownWithError() throws {
		sut = nil
		alphabet = nil
	}

	func testGame_PairsCount_EqualsAlphabetCountTimesTwo() throws {
		// Arrange
		let pairs = sut.pairs

		// Act
		let expectedLength = alphabet.count * 2
		let pairsCount = pairs.count

		// Assert
		XCTAssertTrue(pairsCount == expectedLength, "Length of pairs should be \(expectedLength), but is \(pairsCount)" )
	}

}
