//
//  CharacterLikedViewModel.swift
//  RickAndMorty
//
//  Created by inputlagged on 9/3/22.
//

import UIKit

final class CharacterLikedViewModel: NSObject {
    
    var coordinator: CharacterLikedCoordinator?
    
    weak var collectionView: UICollectionView?
    
    let coreDataManager: CoreDataManagerProtocol
    
    var characterID = [Int]()
    var characterList = [Character?]()
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
    private func fetchLikedCharacters(completion: (Bool) -> Void) {
        do {
            let likedCharacters = try coreDataManager.requestModels()
            for item in 0..<likedCharacters.count {
                characterID.append(Int(likedCharacters[item].id))
            }
            
            if likedCharacters.count != 0 {
                characterList = [Character?](repeating: nil, count: characterID.count)
                completion(true)
            } else {
                completion(false)
            }
        } catch {
            completion(false)
        }
    }
    
    func setupCollectionView() {
        collectionView?.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    func viewDidDisappear(_ characterLikedViewController: CharacterLikedViewController) {
        coordinator?.didFinishCharacterLiked(characterLikedViewController)
    }
    
}

// MARK: - UICollectionViewDataSource

extension CharacterLikedViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as! CharacterCollectionViewCell
        
        if let model = characterList[indexPath.item] {
            cell.setup(with: model)
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CharacterLikedViewModel: UICollectionViewDelegate {
}
// MARK: - UICollectionViewDelegateFlowLayout

extension CharacterLikedViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: (self.collectionView?.superview!.bounds.width)!, spacing: CharacterConstants.Layout.spacing)
        return CGSize(width: width, height: width + CharacterConstants.Layout.heightCardDescription)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let totalSpacing: CGFloat = (CharacterConstants.Layout.itemsInRow * CharacterConstants.Layout.spacingLeft + (CharacterConstants.Layout.itemsInRow - 1) * CharacterConstants.Layout.spacingRight) + CharacterConstants.Layout.minimumInteritemSpacingForSectionAt - CharacterConstants.Layout.spacing
        let finalWidth = (width - totalSpacing) / CharacterConstants.Layout.itemsInRow
        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: CharacterConstants.Layout.spacingTop, left: CharacterConstants.Layout.spacingLeft, bottom: CharacterConstants.Layout.spacingBottom, right: CharacterConstants.Layout.spacingRight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CharacterConstants.Layout.spacingBottom
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CharacterConstants.Layout.minimumInteritemSpacingForSectionAt
    }
}
