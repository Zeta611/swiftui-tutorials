//
//  Landmark.swift
//  LandmarksSwiftUITutorials
//
//  Created by Jaeho Lee on 2019/08/03.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  private var imageName: String
  private var coordinates: Coordinates
  var state: String
  var park: String
  var category: Category

  var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude)
  }

  enum Category: String, CaseIterable, Codable, Hashable {
    case featured = "Featured"
    case lakes = "Lakes"
    case rivers = "Rivers"
  }
}

extension Landmark {
  var image: Image {
    ImageStore.shared.image(name: imageName)
  }
}


struct Coordinates: Hashable, Codable {
  var latitude: Double
  var longitude: Double
}
