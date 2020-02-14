//
//  StarTableViewCell.swift
//  Stars
//
//  Created by Chris Price on 12/5/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var star: Star? {
        didSet { //Anytime the star is set...
            updateViews()
        }
    }
    
    private func updateViews() {
        nameLabel.text = star?.name
        distanceLabel.text = star?.distanceDescription
    }
}
