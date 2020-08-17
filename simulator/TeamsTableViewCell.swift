//
//  TeamsTableViewCell.swift
//  simulator
//
//  Created by Mohammed A.S. Khan on 2/19/20.
//  Copyright © 2020 Mohammed A.S. Khan. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    //MARK: Outlets
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamConference: UILabel!
    @IBOutlet weak var teamRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
