//
//  SongCell.swift
//  songAPI
//
//  Created by Admin on 2/1/19.
//  Copyright © 2019 igc.tn. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
