//
//  ViewController.swift
//  Pairs
//
//  Created by Paul Richardson on 24/06/2021.
//

import UIKit

class ViewController: UIViewController {

	var game: Game?

	override func viewDidLoad() {
		super.viewDidLoad()
		newGame()
 	}

	fileprivate func newGame() {
		game = Game() 
	}
}

