//
//  JournalViewModel.swift
//  MiniChallenge1
//
//  Created by Jeremy Raymond on 27/04/23.
//

import Foundation
import SwiftUI
import CoreData
import CloudKit

class JournalViewModel: ObservableObject {
//    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
//    @Environment(\.managedObjectContext) var moc
     //@ObservedObject var userManager = CoreDataUserManager()
    
//    var user: User
//    var partner: User
    
    //UI Control
//    @StateObject var cm = CoreDataUserManager()
    @Published var text: String = "Text"
    @Published var mood: String = "Mood"
    @Published var need: String = "Need"
    @Published var date: Date = Date.now

    @Published var feeling: [String] = ["joy", "sadness", "fear", "surprise", "anger"]
//    @FetchRequest(sortDescriptors: []) var journals: FetchedResults<Journal>
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    //
    @Published var currentWeek: [Date] = []
    @Published var currentDay: Date = Date()
//    @Published var filteredJournals: [Journal]?
    
    init(){
        fetchCurrentWeek()
    }
    
    func showEmoji(feeling: String) -> String{
        if feeling == "love" {
           return "🥰"
        } else if feeling == "sadness" {
            return "😢"
        } else if feeling == "fear" {
            return "😨"
        } else if feeling == "surprise" {
            return "😱"
        } else if feeling == "anger" {
            return "😡"
        } else if feeling == "joy" {
            return "😆"
        } else {
            return ""
        }
    }
    
    
    // KALENDAR
    // Filtering today journal
//    @Published var filteredJournals: [Journal]?
////    @Published var journals: [Journal]?
//
//    // Filter today journal
//    func filterTodayJournals(){
//        DispatchQueue.global(qos: .userInteractive).async {
//            let calendar = Calendar.current
//            let filtered = self.cm.user.journalArray.filter {
//                return calendar.isDate($0.wrappedDate, inSameDayAs: self.currentDay)
//            }
////            let filtered = self.journals.filter {
////                return calendar.isDate($0.wrappedDate, inSameDayAs: self.currentDay)
////            }
//            DispatchQueue.main.async {
//                withAnimation {
//                    self.filteredJournals = filtered
//                }
//            }
//        }
//    }
    
    func fetchCurrentWeek(){
        let today = Date()
        let calendar = Calendar.current
        
//        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        let range = calendar.range(of: .day, in: .month, for: today)!
        let dayInMonth = range.count

        (1...dayInMonth).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    func extractedDate(date1: Date, format: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date1)
    }
    
    // cheking if current date is today
    func isToday(date2: Date) -> Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date2)
    }
    
    // KALENDAR 
    
//    init() {
//        user = User()
//        partner = User()
//        if users.count >= 2 {
//            user = users[0]
//            partner = users[1]
//        }
//    }
}
