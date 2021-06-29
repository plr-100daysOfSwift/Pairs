//
//  ViewController.swift
//  Pairs
//
//  Created by Paul Richardson on 24/06/2021.
//

import UIKit

class ViewController: UIViewController {

	var game: Game?

	var cards = [UIButton]()
	var activeCards = [UIButton]()

	var buttonA: Array<UIButton>.Index?
	var buttonB: Array<UIButton>.Index?

	override func loadView() {
		super.loadView()
		
		let buttonsView = UIView()
		buttonsView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(buttonsView)

		let title = TitleView()
		view.addSubview(title)

		let buttonWidth: CGFloat = 120
		let buttonHeight: CGFloat = 90
		let rows = 6
		let cols = 8

		NSLayoutConstraint.activate([
			title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			title.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
			buttonsView.widthAnchor.constraint(equalToConstant: buttonWidth * CGFloat(cols)),
			buttonsView.heightAnchor.constraint(equalToConstant: buttonHeight * CGFloat(rows)),
			buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			buttonsView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])

		// create buttons

		var fillRow: Bool = false
		var fillCol: Bool = false
		for row in 0 ..< rows {
			fillRow.toggle()
			for col in 0 ..< cols {
				fillCol.toggle()
				let frame = CGRect(x: CGFloat(col) * buttonWidth, y: CGFloat(row) * buttonHeight, width: buttonWidth, height: buttonHeight)
				let isFilled = fillRow == fillCol ? true : false

				let letterButton = Card(frame: frame)
				letterButton.isFilled = isFilled
				letterButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
				cards.append(letterButton)
				activeCards.append(letterButton)
				buttonsView.addSubview(letterButton)
			}
		}

	}

	override func viewDidLoad() {
		super.viewDidLoad()

		loadGame()

	}

	@IBAction func buttonTapped(_ sender: UIButton) {

		// save the selection
		// TODO: Why does index2 need to be Int?
		if let index1 = buttonA,
			 let index2 = cards.firstIndex(of: sender) {

			guard sender != cards[index1]  else { return }
			guard self.buttonB == nil else { return }

			revealText()
			self.buttonB = index2

			// disable user interaction
			disableCards()

			// test the pair
			let cardA = cards[index1]
			let cardB = cards[index2]
			testPair(a: cardA.title(for: .normal), b: cardB.title(for: .normal))
		} else {
			revealText()
			buttonA = cards.firstIndex(of: sender)
		}

		func revealText() {
			sender.setTitleColor(.black, for: .normal)
			sender.titleLabel?.alpha = 1
		}
	}

	func loadGame() {
		game = Game()
		guard let letters = game?.pairs.keys.shuffled() else { return }
		for (index, letter) in letters.enumerated() {
			cards[index].setTitle(letter, for: .normal)
		}
	}

	func enableCards() {
		activeCards.forEach { button in
			button.titleLabel?.alpha = 0
			button.setTitleColor(.clear, for: .normal)
			button.isEnabled = true
		}
	}

	func disableCards() {
		for (index, button) in activeCards.enumerated() {
			// disable the current selection
			guard index != buttonA,
						index != buttonB else { continue }
			button.isEnabled = false
		}
	}

	func testPair(a: String?, b: String?) {
		guard let indexA = buttonA,
					let indexB = buttonB,
					let a = a,
					let b = b else { return }

		let completion = {
			self.buttonA = nil
			self.buttonB = nil
			// enable user interaction
			self.enableCards()
		}

		let result = game?.isPair(a, b)

		switch  result {
		case true:
			let activeIndices = [indexA, indexB]
			let activeIndicesSorted = activeIndices.sorted(by: >)
			// disable the two characters
			UIView.animate(withDuration: 1.0, delay: 1.5, options: []) {
				for index in activeIndicesSorted {
					self.cards[index].isEnabled = false
					UIButton.animate(withDuration: 1.0) {
						self.cards[index].setTitleColor(.gray, for: .disabled)
						self.cards[index].backgroundColor = .green
					}
					self.activeCards.remove(at: index)
					self.cards.remove(at: index)
				}
			} completion: {_ in completion()}
		case false:
			// hide the two characters
			UIView.animate(withDuration: 2.0, delay: 1.0, options: []) {
				self.cards[indexA].titleLabel?.alpha = 0
				self.cards[indexB].titleLabel?.alpha = 0
			} completion: { _ in completion()}
		default:
			fatalError("Unknown boolean case encountered.")
		}
	}

}
