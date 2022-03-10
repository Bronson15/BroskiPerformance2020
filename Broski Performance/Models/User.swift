//
//  User.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import FirebaseFirestoreSwift

class User: Codable, ObservableObject {
    
    @DocumentID var uid: String?
    @Published var userNumber: String?
    @Published var email: String?
    @Published var userName: String?
    @Published var firstName: String?
    @Published var lastName: String?
    @Published var profilePictureURL: String?
    @Published var signUpDate: String?
    @Published var userWeight: String?
    @Published var bodyMassIndex: String?
    @Published var bodyFatPercent: String?
    @Published var numberOfWorkoutsCompleted: String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userNumber = try container.decode(String.self, forKey: .userNumber)
        email = try container.decode(String.self, forKey: .email)
        userName = try container.decode(String.self, forKey: .userName)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        profilePictureURL = try container.decode(String.self, forKey: .profilePictureURL)
        signUpDate = try container.decode(String.self, forKey: .signUpDate)
        userWeight = try container.decode(String.self, forKey: .userWeight)
        bodyMassIndex = try container.decode(String.self, forKey: .bodyMassIndex)
        bodyFatPercent = try container.decode(String.self, forKey: .bodyFatPercent)
        numberOfWorkoutsCompleted = try container.decode(String.self, forKey: .numberOfWorkoutsCompleted)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userNumber, forKey: .userNumber)
        try container.encode(email, forKey: .email)
        try container.encode(userName, forKey: .userName)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(profilePictureURL, forKey: .profilePictureURL)
        try container.encode(signUpDate, forKey: .signUpDate)
        try container.encode(userWeight, forKey: .userWeight)
        try container.encode(bodyMassIndex, forKey: .bodyMassIndex)
        try container.encode(bodyFatPercent, forKey: .bodyFatPercent)
        try container.encode(numberOfWorkoutsCompleted, forKey: .numberOfWorkoutsCompleted)
    }

    init(uid: String, userNumber: String?, userName: String?, email: String?, firstName: String?,
         lastName: String?, profilePictureURL: String?, signUpDate: String?,
         userWeight: String?, bodyMassIndex: String?, bodyFatPercent: String?,
         numberOfWorkoutsCompleted: String?) {
        self.userNumber = userNumber
        self.email = email
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.profilePictureURL = profilePictureURL
        self.signUpDate = signUpDate
        self.userWeight = userWeight
        self.bodyMassIndex = bodyMassIndex
        self.bodyFatPercent = bodyFatPercent
        self.numberOfWorkoutsCompleted = numberOfWorkoutsCompleted
    }
}

enum CodingKeys: CodingKey {
    case userNumber
    case email
    case userName
    case firstName
    case lastName
    case profilePictureURL
    case signUpDate
    case userWeight
    case bodyMassIndex
    case bodyFatPercent
    case numberOfWorkoutsCompleted
}

extension User {
    
//    var signUpDate: String {
//        let dateTimeFormatter = ISO8601DateFormatter()
//        let dateTime = dateTimeFormatter.date(from: signUpDateTime)!
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .long
//        return dateFormatter.string(from: dateTime)
//    }
//
//    var weight: String  {
//        let formatter = MeasurementFormatter()
//        let inputWeight = Measurement(value: userWeight, unit: UnitMass.pounds)
//
//        if Locale.current.usesMetricSystem {
//            return formatter.string(from: inputWeight.converted(to: .kilograms))
//        }
//        else {
//            return formatter.string(from: inputWeight)
//        }
//    }
}
