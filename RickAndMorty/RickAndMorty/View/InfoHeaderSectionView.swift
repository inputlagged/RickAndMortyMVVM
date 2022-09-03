//
//  InfoHeaderSectionView.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/30/22.
//

import UIKit

final class InfoHeaderSectionView: UITableViewHeaderFooterView {
    
    static let identifier = "InfoHeaderSectionView"
    
    public func setup(with text: String) {
        self.label.text = text
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9.5)
        ])
    }
}

