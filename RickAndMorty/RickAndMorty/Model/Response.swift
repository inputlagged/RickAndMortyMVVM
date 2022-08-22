//
//  Response.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/22/22.
//

import Foundation

struct Response<T: Decodable>: Decodable {
	let info: Info
	let results: [T]
}
