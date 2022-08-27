//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/24/22.
//

import Foundation

final class CharacterDetailViewModel {
    
    var coordinator: CharacterDetailCoordinator?
    var selectedCharacter: Character
    weak var characterDetailHeaderView: CharacterDetailHeaderView?
    
    init(character: Character) {
        self.selectedCharacter = character
    }
    
    // MARK: - Private methods
    
    public func setupHeaderView() {
        self.characterDetailHeaderView?.setup(with: selectedCharacter)
        
    }
}
