//
//  DetailView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ExerciseDetailView: View {
    var exercise: Exercise
    
    var body: some View {
        VStack {            
            ExerciseVideoView(videoPath: exercise.videoPath)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(exercise.muscleGroup)
                        .font(.subheadline)
                        .bold()
                    Spacer()
                    Text(exercise.equipmentNeeded[0])
                        .font(.subheadline)
                        .bold()
                }
                List {
                    ForEach(exercise.howTo.indices) { i in
                        HStack{
                            Image(systemName: symbol[i])
                            Text(exercise.howTo[i])
                        }
                    }
                }
            }
            .padding()
            Spacer()
            
        }
        .navigationBarTitle(Text(exercise.name), displayMode: .inline)
    }
}

var symbol: [String] = [
    "1.circle",
    "2.circle",
    "3.circle",
    "4.circle",
    "5.circle",
    "6.circle",
    "7.circle",
    "8.circle",
    "9.circle",
    "10.circle",
    "11.circle",
    "12.circle",
    "13.circle",
    "14.circle",
    "15.circle",
    "16.circle",
    "17.circle",
    "18.circle",
    "19.circle",
    "20.circle",
    "21.circle",
    "22.circle",
    "23.circle",
    "24.circle",
    "25.circle"
    
]

//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView(exercise: exerciseData[0])
//    }
//}
