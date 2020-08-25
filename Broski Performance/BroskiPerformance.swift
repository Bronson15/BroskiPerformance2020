//
//  BroskiPerformance.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/21/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

@main
struct BroskiPerformance: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}
