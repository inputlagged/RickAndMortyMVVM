//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/24/22.
//

import Foundation
import UIKit

final class CharacterDetailViewModel: NSObject {
    
    var coordinator: CharacterDetailCoordinator?
    var selectedCharacter: Character
    weak var characterDetailHeaderView: CharacterDetailHeaderView?
    weak var detailTableView: UITableView?
    
    init(character: Character) {
        self.selectedCharacter = character
    }
    
    // MARK: - Private methods
    
    public func setupHeaderView() {
        self.characterDetailHeaderView?.setup(with: selectedCharacter)
    }
    
    public func setupDetailTableView() {
        detailTableView?.dataSource = self
        detailTableView?.delegate = self
        detailTableView?.automaticallyAdjustsScrollIndicatorInsets = false
        detailTableView?.register(CharacterDetailTableViewCell.self, forCellReuseIdentifier: CharacterDetailTableViewCell.identifier)
        detailTableView?.register(InfoHeaderSectionView.self, forHeaderFooterViewReuseIdentifier: InfoHeaderSectionView.identifier)
    }
}

// MARK: - UITableViewDataSource

extension CharacterDetailViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailTableViewCell.identifier) as? CharacterDetailTableViewCell else { return UITableViewCell() }
        cell.setup(with: selectedCharacter, indexPath: indexPath)
        return cell
    }
}

extension CharacterDetailViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: InfoHeaderSectionView.identifier) as? InfoHeaderSectionView
        header?.setup(with: "Информация")

        return header
    }
}


