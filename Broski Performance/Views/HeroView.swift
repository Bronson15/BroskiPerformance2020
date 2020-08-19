//
//  BlurredHero.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct HeroView: View {
    var imagePath: String
    var blur: CGFloat
    
    var body: some View {
        FirebaseImage(imagePath: imagePath)
            .aspectRatio(contentMode: .fit)
            .blur(radius: blur)
    }
}

//struct HeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeroView(image: Image("lat_pulldown"), blur: 4)
//    }
//}
