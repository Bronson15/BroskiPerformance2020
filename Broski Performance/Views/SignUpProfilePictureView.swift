//
//  SignUpProfilePictureView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 11/23/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct SignUpProfilePictureView: View {
    var imagePath: String
    
    var body: some View {
        FirebaseImage(imagePath: imagePath)
            .aspectRatio(contentMode: .fit)
            .overlay(ChangePictureOverlay())
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.broskiBlue, lineWidth: 4))
        .frame(height: 275)
    }
}

struct ChangePictureOverlay: View {
    var body: some View {
        Circle()
            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.4)
            .rotationEffect(.degrees(18))
            .overlay(VStack { Spacer(); Text("Tap to Change").foregroundColor(.white).padding(.bottom, 25)})
//            .background(Color.gray)
            .opacity(0.6)
    }
}
