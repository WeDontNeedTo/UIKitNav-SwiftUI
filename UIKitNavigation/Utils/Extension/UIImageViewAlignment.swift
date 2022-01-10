//
//  UIImageViewAlignment.swift
//  UIKitNavigation
//
//  Created by Danil on 07.01.2022.
//

import Foundation
import UIKit

extension UIImage {
  func resizeTopAlignedToFill(containerSize: CGSize) -> UIImage? {
    let scaleTarget = containerSize.height / containerSize.width
    let scaleOriginal = size.height / size.width

    if scaleOriginal <= scaleTarget { return self }

    let newHeight = size.width * scaleTarget
    let newSize = CGSize(width: size.width, height: newHeight)

    UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
    self.draw(in: CGRect(origin: .zero, size: newSize))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage
  }
}
