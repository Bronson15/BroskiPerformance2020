//
//  User.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct User: Hashable, Codable, Identifiable {
    var id: Int
    var userName: String
    var firstName: String
    var lastName: String
    var userWeight: Double
    var bodyMassIndex: Double
    var bodyFatPercent: Double
    var numberOfWorkoutsCompleted: Int
    fileprivate var profilePictureName: String
    fileprivate var backgroundImageName: String
    var savedWorkoutPlanIDs: [Int]
    fileprivate var signUpDateTime: String
}

extension User {
    var profilePicture: Image {
        ImageStore.shared.image(name: profilePictureName)
    }
    
    var backgroundImage: Image {
        ImageStore.shared.image(name: backgroundImageName)
    }
    
    var signUpDate: String {
        let dateTimeFormatter = ISO8601DateFormatter()
        let dateTime = dateTimeFormatter.date(from: signUpDateTime)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: dateTime)
    }
    
    var weight: String  {
        let formatter = MeasurementFormatter()
        let inputWeight = Measurement(value: userWeight, unit: UnitMass.pounds)
        
        if Locale.current.usesMetricSystem {
            return formatter.string(from: inputWeight.converted(to: .kilograms))
        }
        else {
            return formatter.string(from: inputWeight)
        }
    }
}
