//
//  LikedCharacterModel .swift
//  RickAndMorty
//
//  Created by inputlagged on 9/3/22.
//

import Foundation

struct LikedCharacterModel {
    var id: Int
    var isLiked: Bool
    
    mutating func changeValue(id: Int, isLiked: Bool) {
        self.id = id
        self.isLiked = isLiked
    }
}
