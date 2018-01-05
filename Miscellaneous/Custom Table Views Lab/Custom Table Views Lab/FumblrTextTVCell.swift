//
//  FumblrTextTVCell.swift
//  Custom Table Views Lab
//
//  Created by Abhi Singh on 10/12/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class FumblrTextTVCell: UITableViewCell {

    
    @IBOutlet weak var textCell: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
