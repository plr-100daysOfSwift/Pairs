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

	var buttonA: UIButton?
	var buttonB: UIButton?

	override func loadView() {
		super.loadView()
		let buttonsView = UIView()
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
				let letterButton = UIButton(type: .system)
				letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 48)
				letterButton.setTitle("A", for: .normal)
				letterButton.titleLabel?.alpha = 0
				letterButton.layer.borderWidth = 0.5
				letterButton.layer.borderColor = UIColor.gray.cgColor
				let frame = CGRect(x: CGFloat(col) * buttonWidth, y: CGFloat(row) * buttonHeight, width: buttonWidth, height: buttonHeight)
				letterButton.frame = frame
				letterButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
				cards.append(letterButton)
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
		sender.titleLabel?.alpha = 1

		// save the selection
		if buttonA == nil {
			buttonA = sender
		} else {
			buttonB = sender
			// test the pair
			testPair()
		}
	}

	func loadGame() {
		game = Game()
		guard let letters = game?.pairs.keys.shuffled() else { return }
		for (index, letter) in letters.enumerated() {
			cards[index].setTitle(String(letter), for: .normal)
		}
	}
}

