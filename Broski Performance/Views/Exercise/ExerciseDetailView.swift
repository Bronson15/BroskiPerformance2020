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
            HeroView(imagePath: exercise.imagePath, blur: 0)
                .frame(width: UIScreen.main.bounds.width)
                .frame(minHeight: 400)
                .colorMultiply(.broskiBlue)
                .offset(y: -50)
                .padding(.bottom, -150)
                .edgesIgnoringSafeArea(.top)
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
                        Text(String(i + 1) + ". " + exercise.howTo[i])
                    }
                }
            }
            .padding()
            Spacer()
            
        }
        .navigationBarTitle(Text(exercise.name), displayMode: .inline)
    }
}

//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView(exercise: exerciseData[0])
//    }
//}
