//
//  WorkoutListViewModel.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/18/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import Foundation
import Firebase

class WorkoutListViewModel : ObservableObject {
    @Published var workouts = [Workout]()
    
    private let db = Firestore.firestore()
    
    func fetchData() {
        db.collection("workouts").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.workouts = documents.compactMap { queryDocumentSnapshot -> Workout? in
                return try? queryDocumentSnapshot.data(as: Workout.self)
            }
        }
    }
}
