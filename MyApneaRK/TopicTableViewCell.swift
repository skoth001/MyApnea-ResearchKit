//
//  TopicTableViewCell.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/24/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    @IBOutlet var topicTextView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitlelabel: UILabel!
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
