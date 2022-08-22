//
//  CharacterListCoordinator.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/20/22.
//

import UIKit

final class CharacterListCoordinator: Coordinator {
	private(set) var childCoordinators: [Coordinator] = []
	
	private let navigationController: UINavigationController
	private let characterListViewController = CharacterListViewController()
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let networkService = NetworkService()
		let characterListViewModel = CharacterListViewModel(characterNetworkService: networkService)
		characterListViewModel.coordinator = self
		characterListViewController.viewModel = characterListViewModel
		navigationController.setViewControllers([characterListViewController], animated: false)
	
	}
	
	func childDidFinish(_ childCoordinator: Coordinator) {
		if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
			return childCoordinator === coordinator
		}) {
			childCoordinators.remove(at: index)
		}
	}
}
