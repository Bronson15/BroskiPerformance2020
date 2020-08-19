//
//  WorkoutDetailView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct WorkoutDetailView: View {
    var workout: Workout
    var workoutPlanID: String
    @ObservedObject var viewModel = WorkoutDetailViewModel()
    
    var body: some View {
        VStack {
            HeroView(imagePath: workout.imagePath, blur: 0)
                .frame(width: UIScreen.main.bounds.width)
                .frame(minHeight: 400)
                .colorMultiply(.broskiBlue)
                .overlay(WorkoutHeroOverlay(workoutTitle: workout.name))
                .offset(y: -100)
                .padding(.bottom, -200)
                .edgesIgnoringSafeArea(.top)
            VStack {
                HStack {
                    Text("Exercises")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                ExerciseListView(exercises: viewModel.exercises)
            }
            .padding()
            Spacer()
            
        }
        .onAppear() {
            self.viewModel.fetchData(workoutPlanID: workoutPlanID, workoutID: workout.id!)
        }
        .navigationBarTitle(Text(workout.name), displayMode: .inline)
    }
}

//struct WorkoutDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutDetailView(workout: workoutData[1])
//    }
//}
