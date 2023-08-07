//
//  UIImage+.swift
//  TopCariving
//
//  Created by cho seungki on 2023/08/05.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
