//
//  TransformerViewController.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-06.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit

class TransformerViewController: UIViewController, UIBarPositioningDelegate, UITableViewDelegate, UITableViewDataSource
{
    var transformers = [Transformer]()
    
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
                
                self.transformers.append(transformer)
                self.tableView.reloadData()
            }
            present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransformerTableViewCell.self), for: indexPath) as? TransformerTableViewCell
        {
            cell.setup(transformers[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformers.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            transformers.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func sortData() {
        transformers = transformers.sorted(by: { $0.overallRating > $1.overallRating })
        tableView.reloadData()
    }
}
