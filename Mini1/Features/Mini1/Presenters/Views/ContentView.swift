//
//  ContentView.swift
//  MiniChallenge1
//
//  Created by Jeremy Raymond on 25/04/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                AddView()
                    .tabItem {
                        Label("Add", systemImage: "plus")
                    }
//                ImageAndJournalView()
//                    .tabItem {
//                        Label("Add", systemImage: "plus")
//                    }
                TestView1()
                    .tabItem {
                        Label("Partner", systemImage: "person")
                    }
                CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
            }.accentColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
