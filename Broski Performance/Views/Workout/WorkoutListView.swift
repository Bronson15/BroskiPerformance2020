//
//  WorkoutListView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct WorkoutListView: View {
    @ObservedObject var viewModel = WorkoutListViewModel()
    var workouts: [Workout]
    var workoutPlanID: String
    
    var body: some View {
        List(workouts) { workout in
            NavigationLink(destination: WorkoutDetailView(workout: workout, workoutPlanID: workoutPlanID)) {
                WorkoutRowView(workout: workout)
            }
        }
//        .onAppear() {
//            viewModel.fetchData()
//        }
    }
}

//struct WorkoutListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutListView(workoutIDs: [0, 1])
//    }
//}
