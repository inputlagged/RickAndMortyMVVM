//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/24/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var viewmodel: CharacterDetailViewModel!
    
    private var characterDetailsHeaderView: CharacterDetailHeaderView
    
    
    // MARK: - Init
    
    init() {
        self.characterDetailsHeaderView = CharacterDetailHeaderView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        setupUI()
    }
    
    private func setupUI() {
        viewmodel.characterDetailHeaderView = characterDetailsHeaderView
        characterDetailsHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(characterDetailsHeaderView)
        setupConstraints()
        viewmodel.setupHeaderView()
        self.title = viewmodel.selectedCharacter.name
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterDetailsHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterDetailsHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterDetailsHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }
}
