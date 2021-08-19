//
//  TimeEventCustomCell.swift
//  Corporal App
//
//  Created by John Swan on 16.08.2021.
//

import UIKit

class  TimeEventCustomCell: UITableViewCell {

    @IBOutlet weak var timeStartLabel: UILabel!
    @IBOutlet weak var timeEndLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
