//
//  TransformerTableViewCell.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-06.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit

class TransformerTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    func setup(_ transformer: Transformer)
    {
        nameLabel.text      = transformer.name
        ratingLabel.text    = transformer.overallRating.description
        
        print(transformer.description)
        if let _ = transformer as? Autobot {
            avatarImageView.image = #imageLiteral(resourceName: "autobot")
            avatarImageView.tintColor = .autobot
        }
        else if let _ = transformer as? Decepticon {
            avatarImageView.image = #imageLiteral(resourceName: "decepticon")
            avatarImageView.tintColor = .decepticon
        }
        else {
            avatarImageView.image = #imageLiteral(resourceName: "battle")
        }
    }
}
