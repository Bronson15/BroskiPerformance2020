//
//  SignInView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 9/22/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct SignInView : View {

    @State var email: String = ""
    @State var password: String = ""
    @State var userName: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var loading = false
    @State var error = false
    @State var signUp = false

    @EnvironmentObject var session: SessionStore
    
    private let db = Firestore.firestore()

    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    func toggleSignUp() {
        signUp = !signUp
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    Text("Ready to start tracking your workouts? Sign in below!")
                        .font(.title)
                }
                VStack {
                    TextField("Email Address", text: $email)
                        .background(Color.white)
                        .textFieldStyle(MyTextFieldStyle())
                    SecureField("Password", text: $password)
                        .background(Color.white)
                        .textFieldStyle(MyTextFieldStyle())
                }
                .padding()
                if (error) {
                    Text("ahhh crap")
                }
                Button(action: signIn) {
                    Text("Sign In")
                        .foregroundColor(.white)
                }
                .buttonStyle(NeumorphicButtonStyle(bgColor: .broskiBlue))
                
                Text("Not registered yet? Sign up below!")
                Button(action: toggleSignUp) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                }.buttonStyle(NeumorphicButtonStyle(bgColor: .broskiBlue))
                .sheet(isPresented: $signUp, content: {
                    SignUpView()
                })
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.broskiBlue, lineWidth: 3)
        ).padding()
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring())
    }
}
