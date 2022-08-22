//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/20/22.
//

import UIKit

final class CharacterListViewModel: NSObject {
	
	public var coordinator: CharacterListCoordinator?
	
	public weak var collectionView: UICollectionView?
	
	private var characterList: [Character] = [Character(id: 90, name: "Daron Jefferson", status: "Alive", species: "Alien", type: "Cone-nippled alien", gender: "Male", origin: Origin(name: "ss", url: "ss"), location: CharacterLocation(name: "ss", url: "ss"), episode: ["ss"], imageURL: "https://rickandmortyapi.com/api/character/avatar/90.jpeg", created: Date(), url: "ss"), Character(id: 90, name: "Daron Jefferson", status: "Alive", species: "Alien", type: "Cone-nippled alien", gender: "Male", origin: Origin(name: "ss", url: "ss"), location: CharacterLocation(name: "ss", url: "ss"), episode: ["ss"], imageURL: "https://rickandmortyapi.com/api/character/avatar/90.jpeg", created: Date(), url: "ss"), Character(id: 90, name: "Daron Jefferson", status: "Alive", species: "Alien", type: "Cone-nippled alien", gender: "Male", origin: Origin(name: "ss", url: "ss"), location: CharacterLocation(name: "ss", url: "ss"), episode: ["ss"], imageURL: "https://rickandmortyapi.com/api/character/avatar/90.jpeg", created: Date(), url: "ss"), Character(id: 90, name: "Daron Jefferson", status: "Alive", species: "Alien", type: "Cone-nippled alien", gender: "Male", origin: Origin(name: "ss", url: "ss"), location: CharacterLocation(name: "ss", url: "ss"), episode: ["ss"], imageURL: "https://rickandmortyapi.com/api/character/avatar/90.jpeg", created: Date(), url: "ss")]
		
	
	
	// MARK: Helpers
	
	public func setupCollectionView() {
		collectionView?.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
		collectionView?.delegate = self
		collectionView?.dataSource = self
	}
}

// MARK: - UICollectionViewDataSource

extension CharacterListViewModel: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return characterList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as! CharacterCollectionViewCell
		
		cell.setup(with: characterList[indexPath.item])
		
		
		return cell
	}
}

// MARK: - UICollectionViewDelegate

extension CharacterListViewModel: UICollectionViewDelegate {
	
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CharacterListViewModel: UICollectionViewDelegateFlowLayout {
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
