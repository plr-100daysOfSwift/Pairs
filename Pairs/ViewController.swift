//
//  ViewController.swift
//  Pairs
//
//  Created by Paul Richardson on 24/06/2021.
//

import UIKit

typealias Alphabet = [String: (upper: Character, lower: Character)]

class ViewController: UIViewController {

	let greek: Alphabet = [
		"alpha": ("Α", "α"),
		"beta": ("Β", "β"),
		"gamma": ("Γ", "γ"),
		"delta": ("Δ", "δ"),
		"epsilon": ("Ε", "ε"),
		"digamma": ("Ϝ", "ϝ"),
		"zeta": ("Ζ", "ζ"),
		"eta": ("Η", "η"),
		"theta": ("Θ", "θ"),
		"iota": ("Ι", "ι"),
		"kappa": ("Κ", "κ"),
		"lambda": ("Λ", "λ"),
		"mu": ("Μ", "μ"),
		"nu": ("Ν", "ν"),
		"xi": ("Ξ", "ξ"),
		"omicron": ("Ο", "ο"),
		"pi": ("Π", "π"),
		"san": ("Ϻ", "ϻ"),
		"qoppa": ("Ϙ", "ϙ"),
		"rho": ("Ρ", "ρ"),
		"sigma": ("Σ", "σ"),
		"tau": ("Τ", "τ"),
		"upsilon": ("Υ", "υ"),
		"phi": ("Φ", "φ"),
		"chi": ("Χ", "χ"),
		"psi": ("Ψ", "ψ"),
		"omega": ("Ω", "ω"),
		"sampi": ("Ϡ", "ϡ"),
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

