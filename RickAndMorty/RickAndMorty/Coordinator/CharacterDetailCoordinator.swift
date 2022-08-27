//
//  CharacterDetailCoordinator.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/24/22.
//

import UIKit

final class CharacterDetailCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    
    private let navigationController: UINavigationController
    
    public let character: Character
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, character: Character) {
        self.navigationController = navigationController
        self.character = character
    }
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController()
        let characterDetailViewModel = CharacterDetailViewModel(character: character)
        characterDetailViewModel.coordinator = self
        characterDetailViewController.viewmodel = characterDetailViewModel
        navigationController.pushViewController(characterDetailViewController, animated: true)
    }
   
    func didFinishCharacterDetail() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
    }
}
