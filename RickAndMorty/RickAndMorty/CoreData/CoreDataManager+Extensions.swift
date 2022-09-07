//
//  CoreDataManager+Extensions.swift
//  RickAndMorty
//
//  Created by inputlagged on 9/3/22.
//

import Foundation
import CoreData

enum PersistentState {
    case add
    case remove
    case update
}

enum errorCase: Error {
    case noData
}

extension CoreDataManager: CoreDataManagerProtocol {
    func update(viewModel: LikedCharacterModel?, action: PersistentState, and completion: @escaping (Result<PersistentState, Error>) -> Void) {
        switch action {
        case .add:
            guard let viewModel = viewModel else {
                return
            }

            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "LikedCharacter")
            request.predicate = NSPredicate(format: "id == %i", viewModel.id)
            if let likedCharacter = try? managedObjectContext.fetch(request) as? [LikedCharacter], likedCharacter.isEmpty {
                let liked = LikedCharacter(context: managedObjectContext)
                liked.id = NSNumber(value: viewModel.id).int16Value
                liked.isLiked = viewModel.isLiked
                liked.currentDate = Date()
                do {
                    try managedObjectContext.save()
                    completion(.success(.add))
                } catch {
                    completion(.failure(error))
                }
            }
        case .remove:
            guard let viewModel = viewModel else {
                return
            }
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "LikedCharacter")
            request.predicate = NSPredicate(format: "id == %i", viewModel.id)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            do {
                try managedObjectContext.execute(deleteRequest)
                completion(.success(.remove))
            } catch {
                completion(.failure(error))
            }
        case .update:
            break
        }
    }
    
    func requestModels() throws -> [LikedCharacter] {
        let request = LikedCharacter.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(LikedCharacter.currentDate), ascending: true)
        request.sortDescriptors = [sort]
        let likedCharacter = try? managedObjectContext.fetch(request)
        guard let likedCharacter = likedCharacter else { throw errorCase.noData }
        return likedCharacter
    }
    
    func requestModels(withId id: Int) throws -> [LikedCharacter] {
        let request = LikedCharacter.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", id)
        let likedCharacters = try? managedObjectContext.fetch(request)
        guard let likedCharacter = likedCharacters else { throw errorCase.noData }
        return likedCharacter
    }
}
