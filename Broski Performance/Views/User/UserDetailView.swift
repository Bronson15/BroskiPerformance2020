//
//  UserDetailView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import HealthKit

struct UserDetailView: View {
    var user: User
    
    let columns = [ GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        VStack {
            ZStack {
                HeroView(imagePath: "", blur: 4)
                    .frame(width: UIScreen.main.bounds.width)
                    .ignoresSafeArea()
                HStack {
                    CircleImageView(image: user.profilePicture)
                        .frame(width: 125)
                        .offset(x: 15)
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(user.firstName + " " + user.lastName)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Text("@" + user.userName)
                                .font(.headline)
                                .bold()
                                .foregroundColor(.white)
                        }    
                        .padding(5)
                        LazyVGrid(columns: columns) {
                            VStack {
                                Text(user.weight)
                                    .font(.headline)
                                Text("CURRENT WEIGHT")
                                    .font(.caption2)
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 10)
                            VStack {
                                Text(String(user.numberOfWorkoutsCompleted))
                                    .font(.headline)
                                Text("WORKOUTS TRACKED")
                                    .font(.caption2)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.1)
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 10)
                            VStack {
                                Text(String(user.bodyFatPercent) + "%")
                                    .font(.headline)
                                Text("BODY FAT")
                                    .font(.caption2)
                            }
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .padding(.horizontal, 10)
                            VStack {
                                Text(String(user.bodyMassIndex))
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
                    List(user.savedWorkoutPlanIDs, id: \.self) { workoutPlanID in
//                        WorkoutPlanRowView(workoutPlan: workoutPlanData[workoutPlanID])
                    }
                    
                }
                VStack {
                    Text("Broski User #" + String(user.id))
                        .font(.footnote)
                    Text("Member since " + user.signUpDate)
                        .font(.footnote)
                }
            }
            .padding()
            Spacer()
            
        }.onAppear() {
            FetchHealthKitData()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: userData)
    }
}
