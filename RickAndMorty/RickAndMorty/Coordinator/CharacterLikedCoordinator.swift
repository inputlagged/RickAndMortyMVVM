//
//  CharacterLikedCoordinator.swift
//  RickAndMorty
//
//  Created by inputlagged on 9/3/22.
//

import UIKit

final class CharacterLikedCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let coreDataManager = CoreDataManager()
    
    var parentCoordinator: CharacterListCoordinator?
    var parentViewController: UIViewController?
    
    let character: Character?
    
    init(navigationController: UINavigationController, character: Character?) {
        self.navigationController = navigationController
        self.character = character
    }
    
    func start() {
        let characterLikedViewController = CharacterLikedViewController()
        let characterLikedViewModel = CharacterLikedViewModel(coreDataManager: coreDataManager)
        characterLikedViewModel.coordinator = self
        characterLikedViewController.viewModel = characterLikedViewModel
        parentViewController?.addChild(characterLikedViewController)
        parentViewController?.view.addSubview(characterLikedViewController.view)
        characterLikedViewController.didMove(toParent: parentViewController)
    }
    
    func startDetailViewControllerPresent(with character: Character?) {
        guard let character = character else {
            return
        }

        let characterDetailCoordinator = CharacterDetailCoordinator(navigationController: navigationController, character: character)
        characterDetailCoordinator.parentCoordinator = self
        childCoordinators.append(characterDetailCoordinator)
        characterDetailCoordinator.start()
    }
    
    func didFinishCharacterLiked(_ characterLikedViewController: CharacterLikedViewController) {
        characterLikedViewController.willMove(toParent: nil)
        characterLikedViewController.view.removeFromSuperview()
        characterLikedViewController.removeFromParent()
        parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    
}

