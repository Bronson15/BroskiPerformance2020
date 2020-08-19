//
//  CircleImage.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    
    var body: some View {
        image.resizable().aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.broskiBlue, lineWidth: 4))
        .frame(height: 275)
        .shadow(radius: 10)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("big_broski"))
    }
}
