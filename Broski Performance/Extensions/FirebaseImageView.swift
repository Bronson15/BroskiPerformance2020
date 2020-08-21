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

let placeholder = UIImage(named: "bench_press.png")!

struct FirebaseImage: View {
    
    init(imagePath: String) {
        self.imageLoader = Loader(imagePath)
    }

    @ObservedObject private var imageLoader : Loader

    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }

    var body: some View {
        Image(uiImage: image ?? placeholder)
    }
}

import SwiftUI
import Combine
import FirebaseStorage

final class Loader : ObservableObject {
    let didChange = PassthroughSubject<Data?, Never>()
    var data: Data? = nil {
        didSet { didChange.send(data) }
    }

    init(_ imagePath: String){
        // the path to the image
        let url = imagePath
        let storage = Storage.storage()
        let ref = storage.reference().child(url)
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("\(error)")
            }

            DispatchQueue.main.async {
                self.data = data
            }
        }
    }
}
