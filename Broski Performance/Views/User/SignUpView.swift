//
//  SignUpView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 11/23/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct SignUpView: View {
    @EnvironmentObject var session: SessionStore
    @State var loading = false
    @State var error = false
    
    private let db = Firestore.firestore()
    
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    @State var userName: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var profilePictureURL: String = "users/profilePictures/default.png"
    @State var userWeight: String = ""
    @State var bodyMassIndex: String = ""
    @State var bodyFatPercent: String = ""
    
    func signUp() {
        loading = true
        error = false
        
        if (password != passwordConfirmation) {
            error = true
            return
        }
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM d y"
                db.collection("users").document(session.getUserId()).setData([
                    "email": self.email,
                    "userName": self.userName,
                    "firstName": self.firstName,
                    "lastName": self.lastName,
                    "profilePictureURL": self.profilePictureURL,
                    "signUpDate": formatter.string(from: Date()),
                    "numberOfWorkoutsCompleted": "0",
                    "userWeight": self.userWeight,
                    "bodyMassIndex": self.bodyMassIndex,
                    "bodyFatPercentage": self.bodyFatPercent
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                self.email = ""
                self.password = ""
                self.passwordConfirmation = ""
            }
        }

    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Ready to start tracking your workouts? Sign in below!")
                    .font(.title)
            }
            VStack {
                HStack {
                    SignUpProfilePictureView(imagePath: self.profilePictureURL)
                        .frame(maxWidth: 150)
                    TextField("Username", text: $email)
                        .background(Color.white)
                        .textFieldStyle(MyTextFieldStyle())
                }
                TextField("Email Address", text: $email)
                    .background(Color.white)
                    .textFieldStyle(MyTextFieldStyle())
                SecureField("Password", text: $password)
                    .background(Color.white)
                    .textFieldStyle(MyTextFieldStyle())
                SecureField("Confirm Password", text: $passwordConfirmation)
                    .background(Color.white)
                    .textFieldStyle(MyTextFieldStyle())
            }
            .padding()
            if (error) {
                Text("ahhh crap")
            }
            Button(action: signUp) {
                Text("Sign Up")
                    .foregroundColor(.white)
            }
            .buttonStyle(NeumorphicButtonStyle(bgColor: .broskiBlue))
            Spacer()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
