//
//  WorkoutPlanDetailView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct WorkoutPlanDetailView: View {
    var workoutPlan: WorkoutPlan
    @ObservedObject var viewModel = WorkoutPlanDetailViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeroView(imagePath: workoutPlan.imagePath, blur: 0)
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(minHeight: 400)
                    .colorMultiply(.broskiBlue)
                    .overlay(WorkoutHeroOverlay(workoutTitle: workoutPlan.name))
                    .offset(y: -100)
                    .padding(.bottom, -200)
                    .edgesIgnoringSafeArea(.top)
                VStack {
                    HStack {
                        Text("Workouts")
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    WorkoutListView(workouts: viewModel.workouts, workoutPlanID: workoutPlan.id!)
                }
                .padding(.top, -100)
                .padding()
                Spacer()
                
            }
        }
        
        .onAppear() {
            self.viewModel.fetchData(workoutPlanID: workoutPlan.id!)
        }
        .navigationBarTitle(Text(workoutPlan.name), displayMode: .inline)
    }
}

//struct WorkoutPlanDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutPlanDetailView(workoutPlan: workoutPlanData[0])
//    }
//}
