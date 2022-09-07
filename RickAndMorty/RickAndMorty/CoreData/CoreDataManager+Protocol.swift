//
//  CoreDataManager+Protocol.swift
//  RickAndMorty
//
//  Created by inputlagged on 9/3/22.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    func update(viewModel: LikedCharacterModel?, action: PersistentState, and completion: @escaping (Result<PersistentState, Error>) -> Void)
    
    func requestModels() throws -> [LikedCharacter]
    func requestModels(withId id: Int) throws -> [LikedCharacter]
}
