//
//  CategoryImageOverlay.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct CategoryImageOverlay: View {
    var category: String
    var body: some View {
        ZStack {
            Text(category)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }
        .padding(6)
    }
}
