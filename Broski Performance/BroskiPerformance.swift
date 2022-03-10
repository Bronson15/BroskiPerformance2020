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
    
    let page1: OnboardingPage = OnboardingPage(imageName: "appIcon", title: "What's Up, Loyalists?", description: "Welcome to the official Broski Performance app.")
    let page2: OnboardingPage = OnboardingPage(imageName: "appIcon", title: "Find Workout Plans", description: "The Broski Performance app will help you find your next workout plan to help you reach peak performance. All workout plans found here are Broski approved.")
    let page3: OnboardingPage = OnboardingPage(imageName: "appIcon", title: "Read Articles", description: "You'll also be able to read hand picked articles from the Broski performance Team.")
    let page4: OnboardingPage = OnboardingPage(imageName: "appIcon", title: "Track Workouts", description: "Found a plan you want to follow? Use this app to track your workout and see your progress in real time.")
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "Onboarded") {
                AppView().environmentObject(SessionStore())
            }
            else {
                ContentView(pages: [page1, page2, page3, page4]).environmentObject(SessionStore())
            }
        }
    }
}
