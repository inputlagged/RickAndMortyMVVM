//
//  Info.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/22/22.
//

import Foundation

struct Info: Decodable {
	let count: Int
	let pages: Int
	let next: String?
	let prev: String?
}
