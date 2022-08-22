//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/21/22.
//

import Foundation

enum NetworkErrors: Error {
	case wrongURL
	case dataIsEmpty
	case decodeFail
}

final class NetworkService {
	public func baseRequest<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
		
		guard let url = URL(string: url) else {
			completion(.failure(NetworkErrors.wrongURL))
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(error))
				return
			}
			
			guard let data = data else {
				completion(.failure(NetworkErrors.dataIsEmpty))
				return
			}

			let decoder = JSONDecoder()
			do {
				let decodedModel = try decoder.decode(T.self, from: data)
				completion(.success(decodedModel))
			} catch {
				completion(.failure(NetworkErrors.decodeFail))
			}
			
		}.resume()
	}
}

extension NetworkService: NetworkServiceProtocol {
	func fetchCharacters(with params: CharacterURLParamters, and completion: @escaping (Result<Response<Character>, Error>) -> Void) {
		let url = URLFactory.getCharacter(params: params)
		self.baseRequest(url: url, completion: completion)
	}
}
