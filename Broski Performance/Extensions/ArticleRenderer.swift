//
//  ArticleRenderer.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/19/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import Parma
import SwiftUI
import struct Kingfisher.KFImage

struct ArticleRenderer: ParmaRenderable {
    func heading(level: HeadingLevel?, textView: Text) -> Text {
        switch level {
        case .one:
            return textView.font(.system(.largeTitle, design: .serif)).bold()
        case .two:
            return textView.font(.system(.title, design: .serif)).bold()
        case .three:
            return textView.font(.system(.title2)).bold()
        default:
            return textView.font(.system(.title3)).bold()
        }
    }
    
    func headingBlock(level: HeadingLevel?, view: AnyView) -> AnyView {
        switch level {
        case .one, .two:
            return AnyView(
                VStack(alignment: .leading, spacing: 2) {
                    view
                        .padding(.top, 4)
                    Rectangle()
                        .foregroundColor(.broskiBlue)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1, alignment: .center)
                        .padding(.bottom, 8)
                }
            )
        default:
            return AnyView(view.padding(.bottom, 4))
        }
    }
    
    func listItem(view: AnyView) -> AnyView {
        let bullet = "•"
        return AnyView(
            HStack(alignment: .top, spacing: 8) {
                Text(bullet)
                view.fixedSize(horizontal: false, vertical: true)
            }
            .padding(.leading, 4)
        )
    }
    
    func imageView(with urlString: String) -> AnyView {
        AnyView(
            KFImage(URL(string: urlString))
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        )
    }
}
