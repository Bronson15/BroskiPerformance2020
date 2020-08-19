//
//  ExerciseListView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ExerciseListView: View {
    var exercises: [Exercise]
//    @ObservedObject var viewModel = ExerciseListViewModel()
    
    var body: some View {
        List(exercises) { exercise in
            NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                ExerciseRowView(exercise: exercise)
            }
        }
//        .onAppear() {
//            self.viewModel.fetchData()
//        }
    }
}

//struct ExerciseListView_Previews: PreviewProvider {
//    static var previews: some View {
//
//
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//            ExerciseListView(exercises: exerciseData[0, 1, 2])
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//        }
//    }
//}
