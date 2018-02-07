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
    @IBOutlet weak var survivorsLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        battleCountLabel.text = "0"
        winningTeamLabel.text = "-"
        survivorsLabel.text   = "-"
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }


}

