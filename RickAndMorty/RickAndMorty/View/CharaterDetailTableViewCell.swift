//
//  CharaterDetailTableViewCell.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/27/22.
//

import UIKit

final class CharacterDetailTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterDetailCell"
    
    public func setup(with character: Character, indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            label.text = "Gender"
            bottomLabel.text = character.gender
            isUserInteractionEnabled = false
        case 1:
            label.text = "Origin"
            bottomLabel.text = character.origin.name
        case 2:
            label.text = "Type"
            bottomLabel.text = character.type == "" ? "unspecified" : character.type
            isUserInteractionEnabled = false
        case 3:
            label.text = "Location"
            bottomLabel.text = character.location.name
            isUserInteractionEnabled = false
        default:
            break
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [label, bottomLabel].forEach {
            contentView.addSubview($0)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            
            bottomLabel.topAnchor.constraint(equalTo: label.bottomAnchor),
            bottomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bottomLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.5)
        ])
    }
}
