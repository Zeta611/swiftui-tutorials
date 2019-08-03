//
//  CircleImage.swift
//  LandmarksSwiftUITutorials
//
//  Created by Jaeho Lee on 2019/08/03.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
  var body: some View {
    Image("turtlerock")
      .clipShape(Circle())
      .overlay(
        Circle().stroke(Color.white, lineWidth: 4))
      .shadow(radius: 10)
  }
}

#if DEBUG
struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
    CircleImage()
  }
}
#endif
