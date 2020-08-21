//
//  ContentView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Featured Workout Plans")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.bottom, -100)
                .zIndex(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
