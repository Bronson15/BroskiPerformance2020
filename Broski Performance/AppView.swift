//
//  AppView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            FeaturedTabView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Broski Featured")
                }
            ExerciseLibraryListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Exercise Library")
                }
            MyProfileTabView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Profile")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
