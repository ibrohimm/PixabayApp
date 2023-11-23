//
//  UIImageView+Extension.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: String? = nil, placeholder: UIImage? = nil) {
        guard let url = url, url != "" else {
            DispatchQueue.main.async {
                self.image = placeholder
            }
            return
        }
        
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url), placeholder: placeholder)
    }
}
