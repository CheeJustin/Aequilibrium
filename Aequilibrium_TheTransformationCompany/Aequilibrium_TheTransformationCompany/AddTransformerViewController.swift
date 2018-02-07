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
    
    var onDonePressedHandler: ((_ transformer: Transformer) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.addTarget(self, action: #selector(AddTransformerViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)

        nameTextField.becomeFirstResponder()
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
        if let handler = onDonePressedHandler,
            let transformerName = nameTextField.text
        {
            let transformer = Transformer(name: transformerName)
            
            if sliders.count == 8
            {
                transformer.strength       = Int(sliders[0].value)
                transformer.​intelligence   = Int(sliders[1].value)
                transformer.​speed          = Int(sliders[2].value)
                transformer.​endurance      = Int(sliders[3].value)
                transformer.rank           = Int(sliders[4].value)
                transformer.courage        = Int(sliders[5].value)
                transformer.firepower      = Int(sliders[6].value)
                transformer.skill          = Int(sliders[7].value)
            }
            
            handler(transformer)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func textFieldDidChange(_ sender: UITextField) {
        doneButton.isEnabled = !(sender.text ?? "").trimmingCharacters(in: CharacterSet(charactersIn: " ")).isEmpty
    }
}
