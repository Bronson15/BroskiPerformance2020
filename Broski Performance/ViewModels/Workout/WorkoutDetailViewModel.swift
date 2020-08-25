//
//  WorkoutDetailViewModel.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/18/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class WorkoutDetailViewModel : ObservableObject {
    @Published var exercises = [Exercise]()
    
    private let db = Firestore.firestore()
    
    func fetchData(workoutPlanID: String, workoutID: String) {
        db.collection("workoutPlans").document(workoutPlanID).collection("workouts").document(workoutID).collection("exercises").order(by: "exerciseNumber").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.exercises = documents.compactMap { queryDocumentSnapshot -> Exercise? in
                return try? queryDocumentSnapshot.data(as: Exercise.self)
            }
        }
    }
}
