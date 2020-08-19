//
//  ArticleCardImageOverlay.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ArticleCardImageOverlay: View {
    var title: String
    var body: some View {
        ZStack {
            Text(title)
                .font(.headline)
                .bold()
                .padding(6)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .padding(6)
    }
}
