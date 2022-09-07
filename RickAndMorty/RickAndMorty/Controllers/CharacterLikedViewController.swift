//
//  CharacterLikedViewController.swift
//  RickAndMorty
//
//  Created by inputlagged on 9/3/22.
//

import UIKit

final class CharacterLikedViewController: UIViewController {
    
    var viewModel: CharacterLikedViewModel!
    
    private var likedCharacterCollectionView: UICollectionView
    
    // MARK: - Init
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        likedCharacterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        setupUI()
        let leftBarButtonItem = UIBarButtonItem(title: "Characters", style: .plain, target: self, action: #selector(dismissCharacterLikedViewController))
        self.parent?.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc private func dismissCharacterLikedViewController() {
        self.parent?.navigationItem.leftBarButtonItem = nil
//        self.parent.navi
        viewModel.viewDidDisappear(self)
    }
    
    private func setupUI() {
        viewModel.collectionView = likedCharacterCollectionView
        likedCharacterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        likedCharacterCollectionView.backgroundColor = .systemBackground
        view.addSubview(likedCharacterCollectionView)
        viewModel.setupCollectionView()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            likedCharacterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            likedCharacterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            likedCharacterCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            likedCharacterCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
