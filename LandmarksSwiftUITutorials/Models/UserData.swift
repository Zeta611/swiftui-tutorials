//
//  UserData.swift
//  LandmarksSwiftUITutorials
//
//  Created by Jaeho Lee on 2019/08/04.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
  @Published var showFavoritesOnly = false
  @Published var landmarks = landmarkData
}
