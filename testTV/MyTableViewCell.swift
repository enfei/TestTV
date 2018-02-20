//
//  MyTableViewCell.swift
//  testTV
//
//  Created by King on 21/09/2017.
//  Copyright © 2017 GP. All rights reserved.
//

import UIKit
import SDWebImage

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var apiLabel: UILabel!
    @IBOutlet weak var httpsLabel: UILabel!
    
    var data: TestModel? {
        didSet {
            if let thisData = data {
                descriptionLabel.text = "Description: \(thisData.descrip)"
                apiLabel.text = "API: \(thisData.api)"
                httpsLabel.text = "HTTPS: \(thisData.https)"
                itemImageView.sd_setImage(with: URL(string: thisData.link), placeholderImage: UIImage(named: "placeholder.png"))
            }
        }
    }
}
