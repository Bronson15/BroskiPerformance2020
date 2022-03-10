//
//  ExerciseLibraryListView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 9/20/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ExerciseLibraryListView: View {
    @ObservedObject var viewModel = ExerciseLibraryListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.exercises) { exercise in
                NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                    ExerciseRowView(exercise: exercise)
                }
            }
            .navigationTitle("Exercise Library")
        }
        .onAppear() {
            self.viewModel.fetchData()
            print("test")
            print(self.viewModel.$exercises)
        }
    }
}

//struct ExerciseLibraryListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseLibraryListView()
//    }
//}
