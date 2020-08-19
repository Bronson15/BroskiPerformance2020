//
//  WorkoutPlanFeaturedView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/12/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct FeaturedTabView: View {
    @ObservedObject var viewModel = FeaturedTabViewModel()
    
    let rows = [
        GridItem(.fixed(250))
        ]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Looking for a new workout plan? Check out these featured plans, handpicked by Broski Performance.")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, alignment: .center) {
                            ForEach(viewModel.workoutPlans) { workoutPlan in
                                NavigationLink(destination: WorkoutPlanDetailView(workoutPlan: workoutPlan)) {
                                    WorkoutPlanCard(workoutPlan: workoutPlan)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.horizontal)
                    }
                    VStack(alignment: .leading) {
                        Text("Featured Articles")
                            .font(.largeTitle)
                            .bold()
                        Text("Looking to reach peak performance? Broski Performance can help.")
                    }
                    .offset(x: -30)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, alignment: .center) {
                            ForEach(viewModel.articles) { article in
                                ArticleCardView(article: article)                                    
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .onAppear() {
                self.viewModel.fetchData()
            }
            .navigationTitle("Broski Favorites")
            .ignoresSafeArea()
        }
    }
}

//struct FeaturedTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeaturedTabView(workoutPlans: workoutPlanData, articles: articleData)
//    }
//}
