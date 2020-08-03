//
//  ConditionView.swift
//  PythiaStoryboard
//
//  Created by Stuart on 8/2/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class ConditionView: UIView {

   
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var ifConditions: UIStackView!
    
    var compAtts : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    var periodAtts : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.systemGray4]
    
    var andAtts :[NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.backgroundColor: UIColor.systemGray4]
    
    let nibName = "ConditionView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func addSubcondition(sub : Subcondition){
        let conditionLabel : UILabel =
        UILabel()
        conditionLabel.attributedText = NSAttributedString(string: sub.comparandOne, attributes: compAtts) + NSAttributedString(string: sub.periodOne, attributes: periodAtts) + NSAttributedString(string: sub.comparator, attributes: compAtts) + NSAttributedString(string: sub.comparandTwo, attributes: compAtts) + NSAttributedString(string: sub.periodTwo, attributes: periodAtts)
        
        if (ifConditions.subviews.count == 0){
            ifConditions.addArrangedSubview(conditionLabel)
            wrapIf(label: conditionLabel)
            extendView()
        } else {
            let andLabel : UILabel
            andLabel.attributedText =
                NSAttributedString(string: "AND", attributes: andAtts)
            extendView()
            ifConditions.addArrangedSubview(conditionLabel)
            wrapIf(label: conditionLabel)
            extendView()
        }
    }
    /*
    func addPattern(pat : Pattern){
        
    }
    */
    
    func wrapIf(label : UILabel){
        if (label.frame.maxX > superview!.frame.width / 2){
            label.numberOfLines += 1
            wrapIf(label: label)
        }
    }
    func extendView(){
        if (ifConditions.frame.maxY > superview!.safeAreaInsets.bottom - 30) {
            //Condition view extension
            superview!.frame = CGRect(
                origin: superview!.center,
                size: CGSize(
                    width: superview!.frame.width,
                    height: superview!.frame.height + 30))
            //Vertical stack view that holds the conditions extension
            superview!.superview!.frame = CGRect(
            origin: superview!.superview!.center,
            size: CGSize(
                width: superview!.superview!.frame.width,
                height: superview!.superview!.frame.height + 30))
            superview!.superview!.superview!.frame = CGRect(
            origin: superview!.superview!.superview!.center,
            size: CGSize(
                width: superview!.superview!.superview!.frame.width,
                height: superview!.superview!.superview!.frame.height + 30))
            extendView()
        }
    }
}
