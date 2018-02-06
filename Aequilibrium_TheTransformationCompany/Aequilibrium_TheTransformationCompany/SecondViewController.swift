//
//  SecondViewController.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-05.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIBarPositioningDelegate
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: AddTransformerViewController.self)) as? AddTransformerViewController
        {
            present(vc, animated: true, completion: nil)
        }
    }

}

