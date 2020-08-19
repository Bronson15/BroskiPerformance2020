//
//  ExerciseListViewModel.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/18/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import Foundation
import Firebase

class ExerciseListViewModel : ObservableObject {
    @Published var exercises = [Exercise]()
    
    private let db = Firestore.firestore()
    
    func fetchData() {
        db.collection("exercises").addSnapshotListener { (querySnapshot, error) in
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
