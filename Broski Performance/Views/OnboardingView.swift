//
//  OnboardingView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 9/20/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct OnboardingPage : Decodable {
    let imageName: String
    let title: String
    let description: String
}

extension OnboardingPage {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct OnboardingView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack {
            self.page.image
                .resizable()
                .aspectRatio(contentMode: .fit)
            Group {
                HStack {
                    Text(self.page.title)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text(self.page.description)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .padding()
        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
