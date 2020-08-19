//
//  WorkoutPlanCard.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/12/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct WorkoutPlanCard: View {
    @State var workoutPlan: WorkoutPlan
    
    var body: some View {
        ZStack {
            VStack {
                FirebaseImage(imagePath: workoutPlan.imagePath)
                    .cornerRadius(10)
                    .frame(width: 300, height: 150)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.broskiBlue)
                    .overlay(CategoryImageOverlay(category: workoutPlan.category), alignment: .topLeading)
                    .onTapGesture{
                        workoutPlan.expand.toggle()
                    }
                    .sheet(isPresented: $workoutPlan.expand, content: {
                        WorkoutPlanDetailView(workoutPlan: workoutPlan)
                    })
                
                Text(workoutPlan.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .offset(y: -50)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//struct WorkoutPlanCard_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutPlanCard(workoutPlan: workoutPlanData[0])
//    }
//}
