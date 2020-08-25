//
//  Excercise.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/11/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Exercise: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    var imagePath: String
    var muscleGroup: String
    var howTo: [String]
    var equipmentNeeded: [String]
    var exerciseNumber: Int?
}
