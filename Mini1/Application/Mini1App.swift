//
//  Mini1App.swift
//  Mini1
//
//  Created by Jeremy Raymond on 29/04/23.
//

import SwiftUI

@main
struct Mini1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let coreDataUserManager = CoreDataUserManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, CoreDataStack.shared.context)
        }
    }
}
