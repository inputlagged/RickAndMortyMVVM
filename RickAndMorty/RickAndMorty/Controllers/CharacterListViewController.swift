//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/20/22.
//

import UIKit

final class CharacterListViewController: UIViewController {
	
	public var viewModel: CharacterListViewModel!
	
	private var characterCollectionView: UICollectionView
	
	init() {
		let flowLayout = UICollectionViewFlowLayout()
		characterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .red
		
		setupUI()
		viewModel.fetchCharacters()
    }
	
	// MARK: - Private methods
	
	private func setupUI() {
		viewModel.collectionView = characterCollectionView
		
		characterCollectionView.translatesAutoresizingMaskIntoConstraints = false
		characterCollectionView.backgroundColor = .systemBackground
		
		view.addSubview(characterCollectionView)
		viewModel.setupCollectionView()
		setupConstraints()
	}

	private func setupConstraints() {
		NSLayoutConstraint.activate([
			characterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			characterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			characterCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			characterCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}

