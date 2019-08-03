//
//  LandmarkList.swift
//  LandmarksSwiftUITutorials
//
//  Created by Jaeho Lee on 2019/08/03.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
  var body: some View {
    NavigationView {
      List(landmarkData) { landmark in
        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
          LandmarkRow(landmark: landmark)
        }
      }
      .navigationBarTitle(Text("Landmarks"))
    }
  }
}

#if DEBUG
struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(
      ["iPhone SE", "iPhone XS Max"],
      id: \.self)
    {
      LandmarkList()
        .previewDevice(PreviewDevice(rawValue: $0))
        .previewDisplayName($0)
    }
  }
}
#endif
