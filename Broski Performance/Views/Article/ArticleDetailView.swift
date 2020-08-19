//
//  ArticleDetailView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import Parma

struct ArticleDetailView: View {
    var article: Article
    
    var body: some View {
        VStack {
            ScrollView {
                FirebaseImage(imagePath: article.imagePath)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .colorMultiply(.broskiBlue)
                    .overlay(ArticleModalImageOverlay(title: article.title))
                    .overlay(ArticleAuthorModalImageOverlay(author: article.author), alignment: .topLeading)
                
                
                let formattedCopy = article.copy.replacingOccurrences(of: "<br/>", with: "\n")
                
                Parma(formattedCopy, render: ArticleRenderer())
                    .padding()
            }
        }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articleData[0])
    }
}
