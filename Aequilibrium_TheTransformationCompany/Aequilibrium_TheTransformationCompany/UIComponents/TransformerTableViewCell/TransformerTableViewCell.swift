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
    
    
    func setup(_ transformer: Transformer)
    {
        nameLabel.text      = transformer.name
        ratingLabel.text    = transformer.overallRating.description
    }
}
