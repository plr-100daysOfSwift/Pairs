//
//  Card.swift
//  Pairs
//
//  Created by Paul Richardson on 27/06/2021.
//

import UIKit

class Card: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		layer.borderWidth = 0.5
		layer.borderColor = UIColor.gray.cgColor
		setTitleColor(.clear, for: .normal)
		setTitleColor(.clear, for: .disabled)
		titleLabel?.font = UIFont.systemFont(ofSize: 48)
		
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
