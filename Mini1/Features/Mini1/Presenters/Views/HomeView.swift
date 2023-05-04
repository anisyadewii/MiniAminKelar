//
//  HomeView.swift
//  MiniChallenge1
//
//  Created by Jeremy Raymond on 25/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image("example")
            Text("Hello,")
            Text("Maaruf Amin")
            Text("Here's your weekly recap")
            List {
                Text("Tag 1")
                Text("Tag 2")
                Text("Tag 3")
                Text("Tag 4")
            }
            Divider()
            Text("Here's our suggestion for u")
            Text("Some long description for a suggestion")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
