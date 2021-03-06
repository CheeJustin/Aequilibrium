//
//  AutobotViewController.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-05.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit
import Foundation


class AutobotViewController: TransformerViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction override func onAddPressed(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: AddTransformerViewController.self)) as? AddTransformerViewController
        {
            vc.title = "Add Autobot"
            vc.onDonePressedHandler = {
                transformer in
                
                let autobot = transformer.transformToAutobot()
                self.transformers.append(autobot)
                self.sortData()
            }
            present(vc, animated: true, completion: nil)
        }
    }
}

