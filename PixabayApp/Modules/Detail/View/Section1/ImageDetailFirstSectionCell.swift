//
//  ImageDetailFirstSectionCell.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit

final class ImageDetailFirstSectionCell: UITableViewCell {

    @IBOutlet private var detailImage: UIImageView!
    @IBOutlet private var imageSize: UILabel!
    @IBOutlet private var imageType: UILabel!
    @IBOutlet private var imageTags: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: -
    
    func configure(with model: Section1Data) {
        imageSize.text = model.imageSize
        imageType.text = model.imageType
        imageTags.text = model.imageTags
        detailImage.setImage(with: model.image)
    }
}
