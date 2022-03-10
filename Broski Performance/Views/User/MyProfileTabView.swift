//
//  MyProfileTabView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 9/22/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct MyProfileTabView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
      session.listen()
    }

    var body: some View {
       VStack {
        if (UserDefaults.standard.object(forKey: "user") != nil) {
            UserProfileView()
         } else {
            SignInView()
         }
       }
       .onAppear(perform: getUser)
    }
}

struct MyProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileTabView()
    }
}
