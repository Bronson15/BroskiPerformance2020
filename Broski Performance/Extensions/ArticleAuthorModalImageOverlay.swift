//
//  ArticleAuthorModalImageOverlay.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ArticleAuthorModalImageOverlay: View {
    var author: String
    var body: some View {
        ZStack {
            Text(author)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }
        .padding(6)
    }
}
