//
//  LikedCharacter+CoreDataProperties.swift
//  RickAndMorty
//
//  Created by inputlagged on 9/3/22.
//
//

import Foundation
import CoreData


extension LikedCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LikedCharacter> {
        return NSFetchRequest<LikedCharacter>(entityName: "LikedCharacter")
    }

    @NSManaged public var currentDate: Date?
    @NSManaged public var id: Int16
    @NSManaged public var isLiked: Bool

}

extension LikedCharacter : Identifiable {

}
