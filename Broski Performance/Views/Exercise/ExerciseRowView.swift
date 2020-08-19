//
//  ExerciseRowView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ExerciseRowView: View {
    var exercise: Exercise
    
    var body: some View {
        HStack {
            FirebaseImage(imagePath: exercise.imagePath)
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                
            Text(exercise.name)
            Spacer()
        }
    }
}

//struct ExerciseRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ExerciseRowView(exercise: exerciseData[32])
//            ExerciseRowView(exercise: exerciseData[26])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
