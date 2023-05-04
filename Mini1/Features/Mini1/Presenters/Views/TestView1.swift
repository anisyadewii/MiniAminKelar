//
//  TestView1.swift
//  MiniChallenge1
//
//  Created by Jeremy Raymond on 25/04/23.
//

import SwiftUI
import CoreData

struct TestView1: View {
    @StateObject var cm = CoreDataUserManager()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter
    }()
    
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
    
    var body: some View {
        VStack {
//            if !coreDataUserManager.users.isEmpty {
//                Text(coreDataUserManager.user.wrappedName)
//                Text(coreDataUserManager.partner.wrappedName)
////                Text("-------")
//                Text("\(coreDataUserManager.users.count)")
//                Text("\(coreDataUserManager.user.journalArray.count)")
//                Text("\(coreDataUserManager.partner.journalArray.count)")
//                ForEach(0 ..< coreDataUserManager.user.journalArray.count) { journalCount in
//                    Text(coreDataUserManager.user.journalArray[journalCount].wrappedText)
//                    Text("test")
//                }
//                ForEach(0 ..< coreDataUserManager.partner.journalArray.count) { journalCount in
//                    Text(coreDataUserManager.partner.journalArray[journalCount].wrappedText)
//                    Text("test partner")
//                }
                
                List {
                    ForEach(cm.user.journalArray, id: \.self) {
                        journal in
//                        Text(journal.wrappedText)
                        
//                        Section("\(journal.wrappedDate, formatter: dateFormatter)") {
//                        ForEach(journal.feelingArray, id: \.self) { need in
//                            Text(need.wrappedText)
//                            }
//                        }
                        
                        // batas atas
                        Section(journal.wrappedText) {
                        ForEach(journal.feelingArray, id: \.self) { feeling in
                            Text(feeling.wrappedText)
                            Text(showEmoji(feeling: feeling.wrappedText))
                            }
                        }
                        // batas bawah
                        
//                        Text(journal.feelingArray.wrappedText)
                    }
                }
//                ForEach(0 ..< coreDataUserManager.users.count) { x in
//                    var user = coreDataUserManager.users[x]
//                    Text(user.wrappedName)
//                    ForEach(0 ..< user.journalArray.count){ index in
//                        Text(user.journalArray[index].text ?? "")
//                        ForEach(0 ..< user.journalArray[index].feelingArray.count ){ count in
//                            Text(user.journalArray[index].feelingArray[count].wrappedText ?? "blank")
//                        }
//                    }
//                    Text("~~~~~~")
//                }
//            }
//            Button("Delete all") {
//                coreDataUserManager.deleteAll()
//            }
//            .buttonStyle(.borderedProminent)
//            Button("Seed Data") {
//                coreDataUserManager.seedNewData()
//            }
//            .buttonStyle(.borderedProminent)
        }.onAppear{
            cm.fetchAllUser()
        }
    }
}

struct TestView1_Previews: PreviewProvider {
    static var previews: some View {
        TestView1()
    }
}
