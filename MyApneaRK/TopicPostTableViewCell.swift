//
//  TopicPostTableViewCell.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/14/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class TopicPostTableViewCell: UITableViewCell {

    @IBOutlet var postTextView: UIView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var postDescriptionLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
