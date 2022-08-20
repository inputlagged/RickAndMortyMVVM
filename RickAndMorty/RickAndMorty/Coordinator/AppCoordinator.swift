//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/20/22.
//

import UIKit

protocol Coordinator: AnyObject {
	var childCoordinators: [Coordinator] { get }
	func start()
	func childDidFinish(_ childCoordinator: Coordinator)
}

final class AppCoordinator: Coordinator {
	private (set) var childCoordinators: [Coordinator] = []
	
	private let window: UIWindow
	
	init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		let navigationController = UINavigationController()
		let characterListCoordinator = CharacterListCoordinator(navigationController: navigationController)
		childCoordinators.append(characterListCoordinator)
		characterListCoordinator.start()
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
	
	func childDidFinish(_ childCoordinator: Coordinator) {}
	
}
