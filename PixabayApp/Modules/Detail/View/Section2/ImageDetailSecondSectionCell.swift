//
//  ImageDetailSecondSectionCell.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit

final class ImageDetailSecondSectionCell: UITableViewCell {
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var downloadsLabel: UILabel!
    @IBOutlet var favoritesLabel: UILabel!
    @IBOutlet var commentsLabel: UILabel!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var viewsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: -
    
    func configure(with model: Section2Data) {
        userName.text = model.userName
        viewsLabel.text = model.views
        likesLabel.text = model.likes
        commentsLabel.text = model.comments
        favoritesLabel.text = model.favorites
        downloadsLabel.text = model.downloads
    }
}
