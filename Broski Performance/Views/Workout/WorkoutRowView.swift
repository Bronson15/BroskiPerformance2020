//
//  WorkoutRowView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct WorkoutRowView: View {
    var workout: Workout
    
    var body: some View {
        HStack {
            FirebaseImage(imagePath: workout.imagePath)
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
            Text(workout.name)
            Spacer()
        }
    }
}

//struct WorkoutRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            WorkoutRowView(workout: workoutData[0])
//            WorkoutRowView(workout: workoutData[1])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
