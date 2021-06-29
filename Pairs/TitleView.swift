//
//  TitleView.swift
//  Pairs
//
//  Created by Paul Richardson on 29/06/2021.
//

import UIKit

class TitleView: UILabel {

	override init(frame: CGRect) {
		super .init(frame: frame)
		configureLabel()
	}

	required init?(coder: NSCoder) {
		super .init(coder: coder)
		configureLabel()
	}

	func configureLabel () {
		text = "The Greek Alphabet"
		font = UIFont.boldSystemFont(ofSize: 48)
		translatesAutoresizingMaskIntoConstraints = false
		textAlignment = .center
	}

}
