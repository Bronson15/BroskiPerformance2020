//
//  ContentView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let pages: [OnboardingPage]
        
    @State private var currentPage = 0
    @State var lastPage: Bool = false
    @State var getStarted: Bool = false
    
    var body: some View {
        return Group {
            if (getStarted) {
                AppView()
            }
            else {
                VStack {
                
                    TabView(selection: $currentPage) {
                        ForEach (0 ..< self.pages.count) { index in
                            OnboardingView(page: self.pages[index])
                                .tag(index)
                                .padding()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                
                    // NEXT button
                    HStack {
                        Spacer()
                        if self.currentPage == (self.pages.count) {
                            Button(action: {
                                self.getStarted = true
                                UserDefaults.standard.set(self.getStarted, forKey: "Onboarded")
                            }) {
                                Text("Get Started")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.broskiBlue)
                                    .padding()
                                    .background(Capsule().fill(Color.white))
                                
                            }
                            Spacer()
                        } else {
                            Button(action: {
                                withAnimation (.easeInOut(duration: 1.0)) {
                                    self.currentPage = (self.currentPage + 1)
                                }
                            }) {
                                Image(systemName: "arrow.right")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.broskiBlue)
                                    .padding()
                                    .background(Circle().fill(Color.white))
                            }
                        }
                        
                    }
                    .padding()
                }
                .background(Color.broskiBlue)
                .ignoresSafeArea()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
