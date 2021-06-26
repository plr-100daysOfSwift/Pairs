//
//  Game.swift
//  Pairs
//
//  Created by Paul Richardson on 24/06/2021.
//

import Foundation

typealias Alphabet = [String: (upper: String, lower: String)]

struct Game {

	let greek: Alphabet = [
		"alpha": ("Α", "α"),
		"beta": ("Β", "β"),
		"gamma": ("Γ", "γ"),
		"delta": ("Δ", "δ"),
		"epsilon": ("Ε", "ε"),
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
		"rho": ("Ρ", "ρ"),
		"sigma": ("Σ", "σ"),
		"tau": ("Τ", "τ"),
		"upsilon": ("Υ", "υ"),
		"phi": ("Φ", "φ"),
		"chi": ("Χ", "χ"),
		"psi": ("Ψ", "ψ"),
		"omega": ("Ω", "ω"),
	]

	var pairs: [String : String] {
		var pairs = [String : String]()
		greek.forEach { (key: String, value: (upper: String, lower: String)) in
			pairs[value.upper] = value.lower
			pairs[value.lower] = value.upper
		}
		return pairs
	}

	func isPair(_ letterA: String, _ letterB: String) -> Bool {
		return pairs[letterA] == letterB
	}

}
