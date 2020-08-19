//
//  Article.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/16/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Article: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var imagePath: String
    var author: String
    var copy: String
    var expand: Bool
}
