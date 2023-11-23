//
//  ImageTableViewCell.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit

final class ImageTableViewCell: UITableViewCell {

    @IBOutlet private var thumbnailImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with image: ImageModel) {
        userNameLabel.text = image.user
        thumbnailImageView.setImage(with: image.webformatURL)
    }
    
}
