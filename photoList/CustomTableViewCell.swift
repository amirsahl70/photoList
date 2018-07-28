//
//  CustomTableViewCell.swift
//  photoList
//
//  Created by Amir on 7/15/2016.
//  Copyright © 2018 uni. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    

    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Id: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
