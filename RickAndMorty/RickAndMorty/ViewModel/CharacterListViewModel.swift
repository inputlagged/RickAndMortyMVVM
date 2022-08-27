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
	
	private var characterList: [Character] = [] {
		didSet {
			DispatchQueue.main.async {
				self.collectionView?.reloadData()
			}
		}
	}
	private let characterNetworkService: NetworkServiceProtocol
	private var parameters = CharacterURLParamters(page: "1")
	
	
	// MARK: - Init
	
	init(characterNetworkService: NetworkServiceProtocol) {
		self.characterNetworkService = characterNetworkService
	}

	// MARK: Helpers
	
	public func setupCollectionView() {
		collectionView?.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
		collectionView?.delegate = self
		collectionView?.dataSource = self
	}
	
	public func fetchCharacters() {
		characterNetworkService.fetchCharacters(with: parameters) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let response):
				self.characterList.append(contentsOf: response.results)
				let nextPage = Int(self.parameters.page!)! + 1
				self.parameters.page = String(nextPage)
			case .failure(let error):
				print(error)
			}
		}
	}
    
    private func characterCellTapped(with index: Int) {
//        guard let character = characterList[index] else { return }
//        coordinator.sta
        let character = characterList[index] 
        coordinator?.startDetailCharacterViewControllerPresent(with: character)
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
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		guard indexPath.row == characterList.count - 1 else { return }
		fetchCharacters()
	}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        characterCellTapped(with: indexPath.row)
    }
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
