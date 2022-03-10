//
//  SessionStore.swift
//  Broski Performance
//
//  Created by Bronson Lane on 9/22/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Combine

class SessionStore : ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    
    @Published var firebaseUser: User = User(uid: "", userNumber: "", userName: "", email: "", firstName: "", lastName: "", profilePictureURL: "", signUpDate: "", userWeight: "", bodyMassIndex: "", bodyFatPercent: "", numberOfWorkoutsCompleted: "")
    
    private let db = Firestore.firestore()

    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                if (UserDefaults.standard.object(forKey: "user") == nil) {
                    self.getUserFromFirebase(userId: user.uid)
                    print("user fetched from firebase with userID: \(user.uid)")
                    self.session = self.firebaseUser
                }
                else {
                    if let data = UserDefaults.standard.data(forKey: "user") {
                        do {
                            // Create JSON Decoder
                            let decoder = JSONDecoder()

                            // Decode Note
                            self.session = try decoder.decode(User.self, from: data)

                        } catch {
                            print("Unable to Decode User (\(error))")
                        }
                    }
                }
            } else {
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }
    
    func getUserFromFirebase(userId: String) {
        if (userId == "") { return }
        let docRef = db.collection("users").document(userId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.firebaseUser =  { return try! document.data(as: User.self)! }()
                
                if (UserDefaults.standard.object(forKey: "user") == nil) {
                    do {
                        let encoder = JSONEncoder()
                        let data = try encoder.encode(self.firebaseUser)
                        UserDefaults.standard.set(data, forKey: "user")
                    }
                    catch {
                        print("Error encoding user")
                    }
                }
            } else {
                print("Document does not exist")
            }
        }
    }

    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.set(nil, forKey: "user")
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func getUserId () -> String {
        return (session?.uid)!
    }
    
    func unbind () {
            if let handle = handle {
                Auth.auth().removeStateDidChangeListener(handle)
            }
        }
}
