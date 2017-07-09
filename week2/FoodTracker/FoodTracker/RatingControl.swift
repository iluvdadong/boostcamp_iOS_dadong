//
//  RatingControl.swift
//  FoodTracker
//
//  Created by dadong on 2017. 7. 7..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍🏼")
    }
    
    
    
    //MARK: Private Methods
    private func setupButtons() {
    
        
        //create the buttons
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        //Add Constraint
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        //set up the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
    
        //add the button to the stack
        addArrangedSubview(button)
    
    }

}
