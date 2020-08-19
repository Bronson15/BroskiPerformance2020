//
//  WorkoutPlanListView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct WorkoutPlanListView: View {
    @ObservedObject var viewModel = WorkoutPlanListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.workoutPlans) { workoutPlan in
                NavigationLink(destination: WorkoutPlanDetailView(workoutPlan: workoutPlan)) {
                    WorkoutPlanRowView(workoutPlan: workoutPlan)
                }
            }
            .onAppear() {
                self.viewModel.fetchData()
            }
            .navigationBarTitle("Workout Plans")
        }
    }
}

//struct WorkoutPlanListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutPlanListView(workoutPlanIDs: [0, 1])
//    }
//}
