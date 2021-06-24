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

	func testGame_LetterUpperLower_IsPairReturnsTrue() {
		// Arrange
		if let letter = alphabet.randomElement()?.value {
			let upper = letter.upper
			let lower = letter.lower
			// Act
			let result = sut.isPair(upper, lower)

			// Assert
			XCTAssertTrue(result, "isPair should return TRUE for the pair (\(upper), \(lower)) but returned FALSE")
		}
	}

	func testGame_UpperUpper_IsPairReturnsFalse() {
		// Arrange
		if let letterA = alphabet.randomElement(),
			 let letterB = alphabet.filter({ $0.key != letterA.key }).randomElement() {
			let upperA = letterA.value.upper
			let upperB = letterB.value.upper

			// Act
			let result = sut.isPair(upperA, upperB)

			// Assert
			XCTAssertFalse(result, "isPair should return FALSE for the pair (\(letterA), \(letterB)) but returned TRUE")
		}
	}

	func testGame_LowerLower_IsPairReturnsFalse() {
		// Arrange
		if let letterA = alphabet.randomElement(),
			 let letterB = alphabet.filter({ $0.key != letterA.key }).randomElement() {
			let lowerA = letterA.value.lower
			let lowerB = letterB.value.lower

			// Act
			let result = sut.isPair(lowerA, lowerB)

			// Assert
			XCTAssertFalse(result, "isPair should return FALSE for the pair (\(lowerA), \(lowerB)) but returned TRUE")
		}
	}

}
