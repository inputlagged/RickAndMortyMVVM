//
//  UIImageView + Extensions.swift
//  RickAndMorty
//
//  Created by inputlagged on 8/20/22.
//

import UIKit.UIImageView
import Kingfisher

extension UIImageView {
	func setImage(with url: URL?) {
		let placeholder = UIImage(named: "placeholder")
		self.kf.indicatorType = .activity
		self.kf.setImage(with: url, placeholder: placeholder)
	}
}
