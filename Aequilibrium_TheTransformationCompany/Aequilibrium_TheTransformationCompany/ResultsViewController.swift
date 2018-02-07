//
//  FirstViewController.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-05.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UIBarPositioningDelegate
{
    @IBOutlet weak var autobotCountLabel: UILabel!
    @IBOutlet weak var decepticonCountLabel: UILabel!
    @IBOutlet weak var battleCountLabel: UILabel!
    @IBOutlet weak var winningTeamLabel: UILabel!
    @IBOutlet weak var losingTeamLabel: UILabel!
    
    private var autobots    = [Autobot]()
    private var decepticons = [Decepticon]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        battleCountLabel.text = "0"
        winningTeamLabel.text = "-"
        losingTeamLabel.text   = "-"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tvc = tabBarController,
            let vcs = tvc.viewControllers
        {
            for vc in vcs
            {
                if let v = vc as? AutobotViewController,
                    let autobots = v.transformers as? [Autobot]
                {
                    self.autobots = autobots
                }
                else if let v = vc as? DecepticonViewController,
                    let decepticons = v.transformers as? [Decepticon]
                {
                    self.decepticons = decepticons
                }
            }
        }
        
        calculateBattle()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    func calculateBattle()
    {
        autobotCountLabel.text      = autobots.count.description
        decepticonCountLabel.text   = decepticons.count.description
        
        var battleScore         = 0 // Positive will mean autobots win, negatives will mean decepticons win, and 0 means tie
        var autobotSurvivors    = autobots
        var decepticonSurvivors = decepticons
        
        var i = 0
        while i < autobots.count && i < decepticons.count
        {
            let outcome = autobots[i].battle(decepticons[i])
            
            // If both lose, then we end the simulation immediately due to the "Special Condition".
            if outcome == .bothLose
            {
                battleCountLabel.text   = i.description
                winningTeamLabel.text   = "None"
                losingTeamLabel.text    = "Everyone was destroyed"
                return
            }
            // If it's a tie, it's treated as a loss on both sides
            else if outcome == .bothTie
            {
                if let index = autobotSurvivors.index(of: autobots[i]) {
                    autobotSurvivors.remove(at: index)
                }
                
                if let index = decepticonSurvivors.index(of: decepticons[i]) {
                    decepticonSurvivors.remove(at: index)
                }
            }
            else
            {
                if outcome == .decepticonsWin,
                    let index = autobotSurvivors.index(of: autobots[i])
                {
                    autobotSurvivors.remove(at: index)
                    battleScore -= 1
                }
                else if outcome == .autobotsWin,
                    let index = decepticonSurvivors.index(of: decepticons[i])
                {
                    decepticonSurvivors.remove(at: index)
                    battleScore += 1
                }
            }
            
            i += 1
        }
        
        var winningTeam = "Tied"
        var losingTeam  = "-"
        
        if battleScore > 0
        {
            winningTeam = "(Autobots)"
            for autobot in autobotSurvivors {
                winningTeam += "\n\(autobot.name)"
            }
            losingTeam = "(Decepticons)"
            for decepticon in decepticonSurvivors {
                losingTeam += "\n\(decepticon.name)"
            }
        }
        else if battleScore < 0
        {
            winningTeam = "(Decepticons)"
            for decepticon in decepticonSurvivors {
                winningTeam += "\n\(decepticon.name)"
            }
            
            losingTeam = "(Autobots)"
            for autobot in autobotSurvivors {
                losingTeam += "\n\(autobot.name)"
            }
        }
        
        winningTeamLabel.text = winningTeam
        losingTeamLabel.text  = losingTeam
        battleCountLabel.text = i.description
    }


}

