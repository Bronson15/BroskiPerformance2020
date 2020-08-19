//
//  WorkoutPlanListViewModel.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/18/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class WorkoutPlanListViewModel : ObservableObject {
    @Published var workoutPlans = [WorkoutPlan]()
    
    private let db = Firestore.firestore()
    
    func fetchData() {
        db.collection("workoutPlans").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.workoutPlans = documents.compactMap { queryDocumentSnapshot -> WorkoutPlan? in
                return try? queryDocumentSnapshot.data(as: WorkoutPlan.self)
            }
        }
    }
}
