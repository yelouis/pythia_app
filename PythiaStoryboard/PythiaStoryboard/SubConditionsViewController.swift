//
//  SubConditionsViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 8/2/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class SubConditionsViewController: UIViewController {
    
    
    var pctButton : RadioButton = RadioButton.init()
    var dollarsButton : RadioButton = RadioButton.init()
    
    
    override func awakeFromNib() {
        
        self.view.layoutIfNeeded()

        pctButton.isSelected = true
        dollarsButton.isSelected = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pctButton.alternateButton = [dollarsButton]
        dollarsButton.alternateButton = [pctButton]
    }
    
    
}



class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?

    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
    }

    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isSelected = true

            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        } else {
            toggleButton()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }

    func toggleButton() {
        self.isSelected = !isSelected
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = CGColor.init(srgbRed: 0, green: 0, blue: 255, alpha: 1)
            } else {
                self.layer.borderColor = CGColor.init(srgbRed: 125, green: 125, blue: 125, alpha: 1)
            }
        }
    }
}
