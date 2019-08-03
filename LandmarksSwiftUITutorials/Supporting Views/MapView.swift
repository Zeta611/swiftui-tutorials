//
//  MapView.swift
//  LandmarksSwiftUITutorials
//
//  Created by Jaeho Lee on 2019/08/03.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  var coordinate: CLLocationCoordinate2D

  func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: .zero)
  }

  func updateUIView(_ uiView: MKMapView, context: Context) {
    let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    uiView.setRegion(region, animated: true)
  }
}

#if DEBUG
struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: landmarkData[0].locationCoordinate)
  }
}
#endif
