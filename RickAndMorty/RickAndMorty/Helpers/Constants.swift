//
//  Constants.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/20/22.
//

import UIKit

enum Constants {
	enum Images {
		static let statusCircle = UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 8, weight: .regular, scale: .default))
	}
}

enum Colors {
	static let lightGray = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 0.9)
}

struct CharacterConstants {
	struct Layout {
		static let heightCardDescription: CGFloat = 79
		static let itemsInRow: CGFloat = 2
		
		static let spacing: CGFloat = 9
		static let spacingLeft: CGFloat = 9
		static let spacingTop: CGFloat = 9
		static let spacingBottom: CGFloat = 20
		static let spacingRight: CGFloat = 23
		static let minimumInteritemSpacingForSectionAt: CGFloat = 17
		
		static let cornerRadius: CGFloat = 8
		
		static let shadowRadius: CGFloat = 6
		static let shadowOpacity: Float = 0.4
		static let shadowOffsetWidth: CGFloat = 0
		static let shadowOffsetHeight: CGFloat = 5
	}
}
