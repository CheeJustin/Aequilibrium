//
//  AutobotViewController.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-05.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit
import Foundation


class AutobotViewController: UIViewController, UIBarPositioningDelegate, UITableViewDelegate, UITableViewDataSource
{
    var autobots = [Autobot]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: String(describing: TransformerTableViewCell.self), bundle: .main), forCellReuseIdentifier: String(describing: TransformerTableViewCell.self))
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: AddTransformerViewController.self)) as? AddTransformerViewController
        {
            vc.onDonePressedHandler = {
                transformer in
                
                let autobot = transformer.transformToAutobot()
                self.autobots.append(autobot)
                self.tableView.reloadData()
            }
            present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransformerTableViewCell.self), for: indexPath) as? TransformerTableViewCell
        {
            cell.setup(autobots[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autobots.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            autobots.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

