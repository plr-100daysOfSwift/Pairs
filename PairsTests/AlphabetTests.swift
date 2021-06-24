//
//  AlphabetTests.swift
//  PairsTests
//
//  Created by Paul Richardson on 24/06/2021.
//

import XCTest
@testable import Pairs

class AlphabetTests: XCTestCase {

	var storyboard: UIStoryboard!
	var sut: ViewController!
	var greek: Alphabet!
	var game: Game!

	override func setUpWithError() throws {
		storyboard = UIStoryboard(name: "Main", bundle: nil)
		sut = storyboard.instantiateViewController(identifier: "ViewController") as ViewController
		sut.loadViewIfNeeded()
		game = sut.game
		greek = game.greek
	}

	override func tearDownWithError() throws {
		storyboard = nil
		sut = nil
		greek = nil
		game = nil
	}

	func testAlphabet_WhenNameIsAlpha_UppercaseIsΑ() throws {
		// Act
		if let alpha = greek["alpha"] {
			// Assert
			XCTAssertTrue(alpha.upper == "Α", "Expected Α but found \(alpha.upper)")
		} else {
			// TODO: handle element not found
		}

	}

	func testAlphabet_WhenNameIsAlpha_LowercaseIsα() throws {
		// Act
		if let alpha = greek["alpha"] {
			// Assert
			XCTAssertTrue(alpha.lower == "α", "Expected α but found \(alpha.lower)")
		} else {
			// TODO: handle element not found
		}

	}

}
