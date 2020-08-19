//
//  ArticleCardView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI

struct ArticleCardView: View {
    @State var article: Article
    var body: some View {
        ZStack {
            VStack {
                    
                FirebaseImage(imagePath: article.imagePath)
                        .cornerRadius(10)
                        .frame(width: 300, height: 150)
                        .aspectRatio(contentMode: .fit)
                        .colorMultiply(.broskiBlue)
                        .overlay(ArticleCardImageOverlay(title: article.title), alignment: .center)
                        
                                            
                        .onTapGesture{
                            article.expand.toggle()
                        }
                        .sheet(isPresented: $article.expand, content: {
                            ArticleDetailView(article: article)
                        })
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(article: articleData[0])
    }
}
