//
//  URLFactory.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/21/22.
//

import Foundation

enum URLFactory {
	private static let baseURLComponents: URLComponents = {
		let url = URL(string: API.main)!
		var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
		urlComponents.queryItems = []
		return urlComponents
	}()
	
	private static var baseURL: URL {
		return baseURLComponents.url!
	}
	
	static func getCharacter(params: CharacterURLParamters) -> String {
		var urlComponents = baseURLComponents
		let queryItems = [
			URLQueryItem(name: "page", value: params.page ?? ""),
			URLQueryItem(name: "name", value: params.name ?? ""),
			URLQueryItem(name: "status", value: params.status ?? ""),
			URLQueryItem(name: "gender", value: params.gender ?? ""),
		]
		urlComponents.queryItems?.append(contentsOf: queryItems)
		return urlComponents.url!.appendingPathComponent(API.TypeOf.characters).absoluteString
	}
}
