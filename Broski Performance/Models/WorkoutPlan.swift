//
//  WorkoutPlan.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import FirebaseFirestoreSwift

struct WorkoutPlan: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    var imagePath: String
    var category: String
    var expand: Bool
}
