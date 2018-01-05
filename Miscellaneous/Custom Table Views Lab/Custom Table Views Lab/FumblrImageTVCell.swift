//
//  FumblrImageTVCell.swift
//  Custom Table Views Lab
//
//  Created by Abhi Singh on 10/12/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class FumblrImageTVCell: UITableViewCell {

    
    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
