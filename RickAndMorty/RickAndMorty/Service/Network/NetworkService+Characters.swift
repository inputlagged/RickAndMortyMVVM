//
//  NetworkService+Characters.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/22/22.
//

import Foundation

protocol NetworkServiceProtocol {
	func fetchCharacters(with: CharacterURLParamters, and completion: @escaping (Result<Response<Character>, Error>) -> Void)
}
