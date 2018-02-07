//
//  UIImageView+Extension.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-06.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit

extension UIImageView
{
    @IBInspectable var imageColor: UIColor!
    {
        set {
            super.tintColor = newValue
        }
        get {
            return super.tintColor
        }
    }
}
