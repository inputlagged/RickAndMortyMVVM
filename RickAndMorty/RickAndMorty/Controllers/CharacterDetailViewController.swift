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
    private var detailTableView: UITableView
    
    
    // MARK: - Init
    
    init() {
        self.characterDetailsHeaderView = CharacterDetailHeaderView()
        self.detailTableView = UITableView(frame: .zero, style: .plain)
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
        viewmodel.detailTableView = detailTableView
        
        characterDetailsHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(characterDetailsHeaderView)
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailTableView)
        
        setupConstraints()
        viewmodel.setupHeaderView()
        viewmodel.setupDetailTableView()
        self.title = viewmodel.selectedCharacter.name
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterDetailsHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterDetailsHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterDetailsHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            detailTableView.topAnchor.constraint(equalTo: characterDetailsHeaderView.bottomAnchor),
            detailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
