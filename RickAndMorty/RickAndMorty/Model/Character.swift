//
//  Character.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/20/22.
//
	
import Foundation

struct Character: Decodable {
	let id: Int
	let name: String
	let status: String
	let species: String
	let type: String
	let gender: String
	let origin: Origin
	let location: CharacterLocation
	let episode: [String]
	let imageURL: String
	let created: Date
	let url: String
	
	private enum CodingKeys: String, CodingKey {
		case id, name, status, species, type, gender, origin, location, episode, created, url
		case imageURL = "image"
	}
}

struct Origin: Decodable {
	let name: String
	let url: String
}

struct CharacterLocation: Decodable {
	let name: String
	let url: String
}

struct CharacterURLParamters: Decodable {
	var page: String?
}
