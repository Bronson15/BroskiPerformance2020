//
//  ArticleModalImageOverlay.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ArticleModalImageOverlay: View {
    var title: String
    var body: some View {
        ZStack {
            Text(title)
                .font(.title)
                .bold()
                .padding(6)
                .foregroundColor(.white)
        }
        .padding(6)
    }
}
