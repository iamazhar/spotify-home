//
//  UIImage+Extensions.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/5/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import UIKit

extension UIImage {
    func tinted(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        color.set()
        withRenderingMode(.alwaysTemplate)
            .draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
