//
//  SubConditionsViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 8/2/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class SubConditionsViewController: UIViewController {
    
    var subConditionView: SubConditionView { return self.view as! SubConditionView }
    
    //buyWith = false means %, buyWith = true means # of shares
    var buyWith : Bool = true
    var ticker : String = ""
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
    
    override func loadView() {
        //self.view =
    }
    
    @IBAction func buyWithNumShares(_ sender: Any) {
        buyWith = true
    }
    
    
}

class SubConditionView: UIView {
    var makePattern
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 81, green: 165, blue: 186, alpha: 1)
        setupViews()
        //setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(contentView)
        self.addSubview(makePatternButton)
    }
    
    /*
    we may not need this function because we are going to put this view in a stack view
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        contentView.topAnchor.constraint(equalTo: self., constant: <#T##CGFloat#>)
    }
    */
    
    let contentView: UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        return view
    }()
    
    let makePatternButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Make Pattern", for: .normal)
        return button
    }()
    
    
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
