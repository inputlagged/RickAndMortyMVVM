//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/20/22.
//

import UIKit
import Kingfisher

final class CharacterCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "CharacterCell"
	
	public func setup(with character: Character) {
		self.characterImageView.setImage(with: URL(string: character.imageURL))
		self.detailViewNameLabel.text = character.name
		self.detailViewIsAliveImageView.tintColor = character.status == "Alive" ? .green : (character.status == "Dead") ?.red : .gray
		self.detailViewIsAliveLabel.text = "\(character.status) - \(character.species)"
	}
	
	private let characterImageView: UIImageView = {
		let image = UIImageView(frame: .zero)
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFill
		return image
	}()
	
	private let detailView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private let detailViewIsAliveImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = Constants.Images.statusCircle
		return imageView
	}()
	
	private let detailViewIsAliveLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor.gray
		label.lineBreakMode = .byTruncatingTail
		label.adjustsFontSizeToFitWidth = true
		label.font = .systemFont(ofSize: 11, weight: .regular)
		return label
	}()
	
	private let detailViewNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.font = .systemFont(ofSize: 17, weight: .bold)
		label.adjustsFontSizeToFitWidth = true
		label.numberOfLines = 0
		return label
	}()
	
	// MARK: Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupView() {
		[characterImageView, detailView].forEach { contentView.addSubview($0) }
		[detailViewIsAliveImageView, detailViewIsAliveLabel, detailViewNameLabel].forEach { detailView.addSubview($0) }
		setupConstraints()
		setupShadow()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			characterImageView.topAnchor.constraint(equalTo: topAnchor),
			characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -79),
			
			detailView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor),
			detailView.leadingAnchor.constraint(equalTo: leadingAnchor),
			detailView.trailingAnchor.constraint(equalTo: trailingAnchor),
			detailView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			detailViewIsAliveImageView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 12),
			detailViewIsAliveImageView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 12),
			detailViewIsAliveImageView.heightAnchor.constraint(equalToConstant: 13),
			detailViewIsAliveImageView.widthAnchor.constraint(equalToConstant: 13),
			
			detailViewIsAliveLabel.leadingAnchor.constraint(equalTo: detailViewIsAliveImageView.trailingAnchor, constant: 6),
			detailViewIsAliveLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 12),
			detailViewIsAliveLabel.heightAnchor.constraint(equalToConstant: 13),
			detailViewIsAliveLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -12),
			
			detailViewNameLabel.topAnchor.constraint(equalTo: detailViewIsAliveImageView.bottomAnchor, constant: 6),
			detailViewNameLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 12),
			detailViewNameLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -12),
			detailViewNameLabel.heightAnchor.constraint(equalToConstant: 42)
		])
	}
	
	private func setupShadow() {
		contentView.layer.borderWidth = 1
		contentView.layer.borderColor = UIColor.lightGray.cgColor
		contentView.layer.cornerRadius = 6
		contentView.backgroundColor = .white
		contentView.layer.masksToBounds = true
		
		layer.cornerRadius = 6
		layer.masksToBounds = false
		
		layer.shadowRadius = 0
		layer.shadowColor = Colors.lightGray.cgColor
		
		layer.shadowOffset = CGSize(width: 0, height: 0)
		
	}
	
}
