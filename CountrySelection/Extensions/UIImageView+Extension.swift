//
//  UIImageView+Extension.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import UIKit
// MARK:- UIImageView extension class
extension UIImageView {
    /// Method for Load image from URL
    /// - Parameter url: String instance
    func image(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        SVGParser(urlData: data).scaledImageWithSize(CGSize(width: 300, height: 300)) { (image) in
                            self?.image = image
                        }
                    }
            }
        }
    }
}
