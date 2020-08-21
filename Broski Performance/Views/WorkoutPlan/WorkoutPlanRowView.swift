//
//  WorkoutPlanRowView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import FirebaseStorage

struct WorkoutPlanRowView: View {
    @State private var imageURL = URL(string: "")
    var workoutPlan: WorkoutPlan
    
    var body: some View {
        HStack {            
            FirebaseImage(imagePath: workoutPlan.imagePath)
                .frame(width: 50, height: 50)
            Text(workoutPlan.name)
            Spacer()
        }
    }
}

//struct WorkoutPlanRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutPlanRowView(workoutPlan: workoutPlanData[0])
//    }
//}
