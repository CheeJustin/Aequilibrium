//
//  AddTransformerViewController.swift
//  Aequilibrium_TheTransformationCompany
//
//  Created by Justin Chee on 2018-02-05.
//  Copyright © 2018 Justin Chee. All rights reserved.
//

import UIKit

class AddTransformerViewController: UIViewController, UIBarPositioningDelegate
{
    @IBOutlet var sliders: [UISlider]!
    @IBOutlet var attributeLabels: [UILabel]!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.addTarget(self, action: #selector(AddTransformerViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)

    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

    @IBAction func onValueChanged(_ sender: UISlider) {
        if let index = sliders.index(of: sender) {
            attributeLabels[index].text = Int(sender.value).description
        }
    }
    
    @IBAction func onCancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onDonePressed(_ sender: UIBarButtonItem) {
        
    }
    
    func textFieldDidChange(_ sender: UITextField) {
        doneButton.isEnabled = !(sender.text ?? "").trimmingCharacters(in: CharacterSet(charactersIn: " ")).isEmpty
    }
}
