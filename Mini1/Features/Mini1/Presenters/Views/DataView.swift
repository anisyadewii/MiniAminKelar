//
//  DataView.swift
//  Mini1
//
//  Created by Jeremy Raymond on 29/04/23.
//

import SwiftUI

struct DataView: View {
    @StateObject var coreDataUserManager = CoreDataUserManager()
    
    var body: some View {
        VStack {
            if !coreDataUserManager.users.isEmpty {
                Text(coreDataUserManager.user.wrappedName)
                Text(coreDataUserManager.partner.wrappedName)
                Text("-------")
                Text("\(coreDataUserManager.users.count)")
                Text("\(coreDataUserManager.user.journalArray.count)")
                Text("\(coreDataUserManager.partner.journalArray.count)")
                ForEach(0 ..< coreDataUserManager.user.journalArray.count) { journalCount in
                    Text(coreDataUserManager.user.journalArray[journalCount].wrappedText)
                    Text("test")
                }
                ForEach(0 ..< coreDataUserManager.partner.journalArray.count) { journalCount in
                    Text(coreDataUserManager.partner.journalArray[journalCount].wrappedText)
                    Text("test partner")
                }
            }
//            Button("Delete all") {
//                coreDataUserManager.deleteAll()
//            }
//            .buttonStyle(.borderedProminent)
            Button("Seed Data") {
                coreDataUserManager.seedNewData()
            }
            .buttonStyle(.borderedProminent)
        }.onAppear{
            coreDataUserManager.fetchAllUser()
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
