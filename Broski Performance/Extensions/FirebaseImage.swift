//
//  FirebaseImageView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/18/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct FirebaseImage: View {
    @State private var imageURL = URL(string: "")
    var imagePath: String
    
    var body: some View {
        WebImage(url: imageURL)
            .resizable()
            .onAppear { loadImageFromFirebase(imagePath: imagePath) }
    }
    
    func loadImageFromFirebase(imagePath: String) {
         let storageRef = Storage.storage().reference(withPath: imagePath)
          storageRef.downloadURL { (url, error) in
             if error != nil {
                 print((error?.localizedDescription)!)
                 return
             }
            self.imageURL = url!
          }
    }
}
