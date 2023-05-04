//
//  User+CoreDataProperties.swift
//  MiniChallenge1
//
//  Created by Jeremy Raymond on 28/04/23.
//
//

import Foundation
import CoreData


extension User: Identifiable {
    
    public var id: NSManagedObjectID{
        return objectID
    }

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var journal: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown User"
    }
    
    public var journalArray: [Journal] {
        let array = journal?.allObjects as [Journal]
        return array.sorted { $0.wrappedText < $1.wrappedText}
    }

}

// MARK: Generated accessors for journal
extension User {

    @objc(addJournalObject:)
    @NSManaged public func addToJournal(_ value: Journal)

    @objc(removeJournalObject:)
    @NSManaged public func removeFromJournal(_ value: Journal)

    @objc(addJournal:)
    @NSManaged public func addToJournal(_ values: NSSet)

    @objc(removeJournal:)
    @NSManaged public func removeFromJournal(_ values: NSSet)

}
