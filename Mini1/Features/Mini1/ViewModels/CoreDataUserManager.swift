//
//  CoreDataUserManager.swift
//  MiniChallenge1
//
//  Created by Jeremy Raymond on 28/04/23.
//

import Foundation
import CoreData

class CoreDataUserManager: ObservableObject {
    @Published var users: [User] = []
//    var moc = DataController.moc
    var moc = CoreDataStack.moc
    private var stack = CoreDataStack.shared
//    @Environment(\.managedObjectContext) var moc
    
    var user = User()
    var partner = User()
    
    public func fetchAllUser(){
        let request: NSFetchRequest<User> = User.fetchRequest()
        guard let users = try? moc.fetch(request) else { return }
        self.users = users
        
        if !users.isEmpty {
            user = users[0]
            partner = users[1]
        }
    }
    
    public func addJournal(date: Date, feelings: String, text: String) {
        var journal = Journal(context: moc)
        journal.date = date
        journal.text = text
        journal.origin = user
        
        var feeling = Feeling(context: moc)
        feeling.text = feelings
        feeling.origin = journal
        
        if moc.hasChanges {
            stack.save()
//            try? moc.save()
        }
    }
    
    public func addJournal2(date: Date, feelings: [String], text: String) {
        var journal = Journal(context: moc)
        journal.date = date
        journal.text = text
        journal.origin = user
        
        for feeling in feelings {
            let item = Feeling(context: moc)
            item.text = feeling
            item.origin = journal
        }
        
        if moc.hasChanges {
            stack.save()
//            try? moc.save()
        }
    }
    
    public func seedNewData(){
        if users.isEmpty {
            let user = User(context: moc)
            user.name = "User Name \(users.count)"
            
            let partner = User(context: moc)
            partner.name = "Partner Name"
            
            if moc.hasChanges {
//                try? moc.save()
                stack.save()
                users.append(user)
            }
        }
    }
    
    init() {
        fetchAllUser()
        seedNewData()
    }
    
//    func deleteAll() {
//          let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
//          let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
//        _ = try? moc.execute(batchDeleteRequest1)
//        users.removeAll()
//    }
    
}
