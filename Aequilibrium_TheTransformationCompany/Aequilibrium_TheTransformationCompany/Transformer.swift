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
    
    convenience init(name: String) {
        self.init()
        
        self.name = name
    }
    
    override var description: String {
        return "Transformer"
    }
    
    func transformToAutobot() -> Autobot
    {
        let autobot               = Autobot(name: name)
        autobot.strength          = strength
        autobot.​intelligence      = ​intelligence
        autobot.​speed             = ​speed
        autobot.​endurance         = ​endurance
        autobot.rank              = rank
        autobot.courage           = courage
        autobot.firepower         = firepower
        autobot.skill             = skill
        
        return autobot
    }
    
    
    func transformToDecepticon() -> Decepticon
    {
        let decepticon            = Decepticon(name: name)
        decepticon.strength       = strength
        decepticon.​intelligence   = ​intelligence
        decepticon.​speed          = ​speed
        decepticon.​endurance      = ​endurance
        decepticon.rank           = rank
        decepticon.courage        = courage
        decepticon.firepower      = firepower
        decepticon.skill          = skill
        
        return decepticon
    }
}
