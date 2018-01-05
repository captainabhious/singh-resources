//
//  CoolTableViewCell.swift
//  Custom Table Views Lesson
//
//  Created by Abhi Singh on 10/12/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class CoolTableViewCell: UITableViewCell {


    @IBOutlet weak var coolCellLabel: UILabel!
    @IBOutlet weak var badassButtonLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // let cells go to default value for dequeuable
    override func prepareForReuse() {
        coolCellLabel.text = "this is my label"
    }
    
}
