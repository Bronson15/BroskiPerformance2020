//
//  UserProfileView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 11/15/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    let columns = [ GridItem(.adaptive(minimum: 100))]
    @EnvironmentObject var session: SessionStore
    
    func signOut () {
        session.signOut()
    }
    
    var body: some View {
        VStack {
            ZStack {
                HeroView(imagePath: "articles/big_wife_lil.png", blur: 4)
                    .frame(width: UIScreen.main.bounds.width)
                    .ignoresSafeArea()
                HStack {
                    CircleImageView(imagePath: session.session?.profilePictureURL ?? "")
                        .frame(width: 125)
                        .offset(x: 15)
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(String((session.session?.firstName ?? "") + " " + (session.session?.lastName ?? "")))
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Text("@" + (session.session?.userName ?? ""))
                                .font(.headline)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(5)
                        LazyVGrid(columns: columns) {
                            VStack {
                                Text((session.session?.userWeight ?? ""))
                                    .font(.headline)
                                Text("CURRENT WEIGHT")
                                    .font(.caption2)
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 10)
                            VStack {
                                Text((session.session?.numberOfWorkoutsCompleted ?? ""))
                                    .font(.headline)
                                Text("WORKOUTS TRACKED")
                                    .font(.caption2)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.1)
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 10)
                            VStack {
                                Text((session.session?.bodyFatPercent ?? "") + "%")
                                    .font(.headline)
                                Text("BODY FAT")
                                    .font(.caption2)
                            }
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .padding(.horizontal, 10)
                            VStack {
                                Text((session.session?.bodyMassIndex ?? ""))
                                    .font(.headline)
                                Text("BMI")
                                    .font(.caption2)
                            }
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .padding(.horizontal, 10)
                        }
                        .background(Color.offWhite)
                        .opacity(0.8)
                    }
                    .background(Color.broskiBlue)
                    .opacity(0.8)
                    .cornerRadius(10)
                    .padding()
                }
                .padding(.top, -75)
                .padding(.horizontal, -5)
            }
            VStack {
                VStack {
                    HStack {
                        Text ("Recently Completed")
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    .padding()
    //                    List(user.savedWorkoutPlanIDs, id: \.self) { workoutPlanID in
    ////                        WorkoutPlanRowView(workoutPlan: workoutPlanData[workoutPlanID])
    //                    }

                }
                VStack {
                    Button(action: signOut) {
                        Text("Sign Out")
                    }
                    Text("Broski User #" + (session.session?.userNumber ?? ""))
                        .font(.footnote)
                    Text("Member since " + (session.session?.signUpDate ?? ""))
                        .font(.footnote)
                }
            }
            .padding()
            Spacer()
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
