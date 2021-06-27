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
		buttonsView.backgroundColor = .green
		buttonsView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(buttonsView)

		let title = UILabel()
		title.text = "The Greek Alphabet"
		title.font = UIFont.boldSystemFont(ofSize: 48)
		title.translatesAutoresizingMaskIntoConstraints = false
		title.textAlignment = .center
		view.addSubview(title)

		let buttonWidth: CGFloat = 135
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

		for row in 0 ..< rows {
			for col in 0 ..< cols {
				let frame = CGRect(x: CGFloat(col) * buttonWidth, y: CGFloat(row) * buttonHeight, width: buttonWidth, height: buttonHeight)
				let letterButton = Card(frame: frame)
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
		// reveal the character
		sender.setTitleColor(.black, for: .normal)
		sender.titleLabel?.alpha = 1

		// save the selection
		// TODO: Why does index2 need to be Int?
		if let index1 = buttonA,
			 let index2 = cards.firstIndex(of: sender) {

			guard sender != cards[index1]  else { return }
			guard self.buttonB == nil else { return }

			self.buttonB = index2

			// disable user interaction
			disableCards()

			// test the pair
			let cardA = cards[index1]
			let cardB = cards[index2]

			testPair(a: cardA.title(for: .normal), b: cardB.title(for: .normal))
		} else {
			buttonA = cards.firstIndex(of: sender)
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

		let result = game?.isPair(a, b)

		switch  result {
		case true:
			let activeIndices = [indexA, indexB]
			let activeIndicesSorted = activeIndices.sorted(by: >)
			// remove the two buttons
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
				for index in activeIndicesSorted {
					self?.activeCards.remove(at: index)
					self?.cards[index].isHidden = true
					self?.cards.remove(at: index)
				}

				self?.buttonA = nil
				self?.buttonB = nil

				// enable user interaction
				self?.enableCards()
			}
		case false:
			// hide the two characters
			DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
				self?.cards[indexA].titleLabel?.alpha = 0
				self?.cards[indexB].titleLabel?.alpha = 0
				self?.buttonA = nil
				self?.buttonB = nil

				// enable user interaction
				self?.enableCards()
			}
		default:
			fatalError("Unknown boolean case encountered.")
		}
	}

}





