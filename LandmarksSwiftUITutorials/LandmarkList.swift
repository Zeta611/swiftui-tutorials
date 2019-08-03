//
//  LandmarkList.swift
//  LandmarksSwiftUITutorials
//
//  Created by Jaeho Lee on 2019/08/03.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
  @EnvironmentObject var userData: UserData

  var body: some View {
    NavigationView {
      List {
        Toggle(isOn: $userData.showFavoritesOnly) {
          Text("Favorites only")
        }

        ForEach(userData.landmarks) { landmark in
          if !self.userData.showFavoritesOnly || landmark.isFavorite {
            NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
              LandmarkRow(landmark: landmark)
            }
          }
        }
      }
      .navigationBarTitle(Text("Landmarks"))
    }
  }
}

#if DEBUG
struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList()
      .environmentObject(UserData())
  }
}
#endif
