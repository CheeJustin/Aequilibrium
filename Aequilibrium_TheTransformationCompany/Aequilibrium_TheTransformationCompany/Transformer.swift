//
//  Transformer.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-05.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import Foundation

let autoWinTransformers = ["Optimus Prime", "Predaking"]

enum BattleOutcome
{
    case autobotsWin
    case decepticonsWin
    case bothTie
    case bothLose
}

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
    
    
    func battle(_ opponent: Transformer) -> BattleOutcome?
    {
        // Special Condition: Any ​Transformer ​named ​Optimus ​Prime ​or ​Predaking ​wins ​his ​fight ​automatically ​regardless ​of any ​other ​criteria. In ​the ​event ​either ​of ​the ​above ​face ​each ​other ​(or ​a ​duplicate ​of ​each ​other), ​the ​game immediately ​ends ​with ​all ​competitors ​destroyed
        if autoWinTransformers.contains(name) && autoWinTransformers.contains(opponent.name) {
            return .bothLose
        }
        else if autoWinTransformers.contains(name) {
            return .autobotsWin
        }
        else if autoWinTransformers.contains(opponent.name) {
            return .decepticonsWin
        }
        // Condition 1: If ​any ​fighter ​is ​down ​4 ​or ​more ​points ​of ​courage ​and ​3 ​or ​more ​points ​of ​strength compared ​to ​their ​opponent, ​the ​opponent ​automatically ​wins ​the ​face-off ​regardless ​of overall ​rating ​(opponent ​has ​ran ​away)
        else if courage - opponent.courage >= 4 && strength - opponent.strength >= 3 {
            return .autobotsWin
        }
        else if courage - opponent.courage <= -4 && strength - opponent.strength <= -3 {
            return .decepticonsWin
        }
        // Condition 2: Otherwise, ​if ​one ​of ​the ​fighters ​is ​3 ​or ​more ​points ​of ​skill ​above ​their ​opponent, ​they ​win the ​fight ​regardless ​of ​overall ​rating
        else if skill - opponent.skill >= 3 {
            return .autobotsWin
        }
        else if skill - opponent.skill <= -3 {
            return .decepticonsWin
        }
        // Condition 3: Otherwise, the ​winner ​is ​the ​Transformer ​with ​the ​highest ​overall ​rating
        else {
            if overallRating > opponent.overallRating {
                return .autobotsWin
            }
            else if overallRating < opponent.overallRating {
                return .decepticonsWin
            }
            // If tied, they both lose
            else {
                return .bothTie
            }
        }
    }
}
