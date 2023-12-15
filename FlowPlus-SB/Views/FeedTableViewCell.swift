//
//  FeedTableViewCell.swift
//  FlowPlus-SB
//
//  Created by Talish George on 15/12/2023.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userNameTitleButton: UIButton!
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var likesCountLabel: UILabel!
    
    @IBOutlet weak var postCommentLabel: UILabel!
    
    @IBOutlet weak var commentCountButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.layer.masksToBounds = true
        
        selectionStyle = UITableViewCell.SelectionStyle.none
    }
}
