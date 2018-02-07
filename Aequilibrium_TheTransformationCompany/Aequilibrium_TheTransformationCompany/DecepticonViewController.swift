//
//  DecepticonViewController.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-06.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit

class DecepticonViewController: TransformerViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction override func onAddPressed(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: AddTransformerViewController.self)) as? AddTransformerViewController
        {
            vc.title = "Add Decepticon"
            vc.onDonePressedHandler = {
                transformer in
                
                let decepticon = transformer.transformToDecepticon()
                self.transformers.append(decepticon)
                self.sortData()
            }
            present(vc, animated: true, completion: nil)
        }
    }
}
