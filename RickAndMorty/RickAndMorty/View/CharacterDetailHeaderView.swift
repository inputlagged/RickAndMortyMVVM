//
//  CharacterDetailHeaderView.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/26/22.
//

import UIKit

final class CharacterDetailHeaderView: UIView {
    
    public func setup(with character: Character) {
        statusLabel.text = character.status
        nameLabel.text = character.name
        speciesLabel.text = character.species
        avatarImageView.setImageOffline(with: URL(string: character.imageURL))
    }
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = Colors.lightGrayDetail
        return imageView
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = Colors.lightGrayDetail.cgColor
        imageView.layer.borderWidth = 5.0
        imageView.layer.cornerRadius = 70.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = .systemFont(ofSize: 11.0, weight: .regular)
        label.textAlignment = .center
        return label
    }()
   
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = .systemFont(ofSize: 13.0, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.lightGray
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [backgroundImageView, avatarImageView, statusLabel, nameLabel, speciesLabel].forEach {
            addSubview($0)
        }
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 19.0),
            avatarImageView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -70.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 140.0),
            avatarImageView.widthAnchor.constraint(equalToConstant: 140.0),
            
            statusLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 15.0),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            
            nameLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            speciesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            speciesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            speciesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.0),
        ])
    }
}
