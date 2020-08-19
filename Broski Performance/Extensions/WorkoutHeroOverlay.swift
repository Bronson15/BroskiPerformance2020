//
//  WorkoutHeroOverlay.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/17/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct WorkoutHeroOverlay: View {
    var workoutTitle: String
    var body: some View {
        ZStack {
            Text(workoutTitle)
                .font(.title)
                .bold()
                .padding(6)
                .foregroundColor(.white)
        }
        .padding(6)
    }
}
