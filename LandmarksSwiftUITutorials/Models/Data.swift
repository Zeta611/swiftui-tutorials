//
//  Data.swift
//  LandmarksSwiftUITutorials
//
//  Created by Jaeho Lee on 2019/08/03.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import UIKit
import SwiftUI

let landmarkData: [Landmark] = load("landmarkData.json")

private func load<T: Decodable>(
  _ filename: String,
  as type: T.Type = T.self) -> T
{
  let data: Data

  guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
      fatalError("Couldn't find \(filename) in main bundle.")
  }

  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }

  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}


final class ImageStore {
  private var images: [String: CGImage] = [:]

  private static var scale = 2

  static var shared = ImageStore()

  func image(name: String) -> Image {
    let cgImage = _guaranteeImage(name: name)

    return Image(
      cgImage,
      scale: CGFloat(ImageStore.scale),
      label: Text(verbatim: name))
  }

  static func loadImage(name: String) -> CGImage {
    guard
      let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
      let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
      let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
    else {
      fatalError("Couldn't load image \(name).jpg from main bundle.")
    }
    return image
  }

  private func _guaranteeImage(name: String) -> CGImage {
    if let cgImage = images[name] { return cgImage }

    let cgImage = ImageStore.loadImage(name: name)
    images[name] = cgImage
    return cgImage
  }
}
