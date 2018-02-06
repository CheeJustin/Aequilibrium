//
//  Transformer.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-05.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import Foundation

class Transformer: NSObject
{
    var name            = ""
    
    var strength        = 1
    var ​intelligence    = 1
    var ​speed           = 1
    var ​endurance       = 1
    var rank            = 1
    var courage         = 1
    var firepower       = 1
    var skill           = 1
    
    var overallRating: Int {
        get {
            return strength + ​intelligence + ​speed + ​endurance + firepower
        }
    }
}
