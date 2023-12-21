//
//  StoryCollectionViewCell.swift
//  FlowPlus-SB
//
//  Created by Talish George on 15/12/2023.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //storyImage.layer.cornerRadius = storyImage.frame.width/2
        //storyImage.layer.masksToBounds = true
        //storyImage.clipsToBounds = true
        storyImage.layer.borderColor = UIColor.white.cgColor
        storyImage.layer.borderWidth = CGFloat(3.0)
    }
    override func layoutSubviews() {
           super.layoutSubviews()
           storyImage.layer.cornerRadius = storyImage.frame.width / 2
       }
}
