//
//  ExerciseVideoView.swift
//  Broski Performance
//
//  Created by Bronson Lane on 9/20/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import SwiftUI
import AVKit

struct ExerciseVideoView: View {
    var videoPath: String
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  URL(string: videoPath)!)) {
        }
    }
}

//struct ExerciseVideoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseVideoView()
//    }
//}
