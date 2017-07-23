//
//  ViewController.swift
//  Quiz
//
//  Created by DaHye on 2017. 7. 3..
//  Copyright © 2017년 Dadong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    
    
    let questions: [String] = ["김다동이 사는 곳은?",
                               "what is 7+7",
                               "what is thr capital of Vermont?"]
    
    let answers: [String] = ["정자동",
                             "14",
                             "Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(_ sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animatedLabelTransitions()
    }
    
    func animatedLabelTransitions() {
        
        // Force any outstading layout changes to occur
        view.layoutIfNeeded()
        // Animate the alpha
        // and the center X constraints
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        
                        self.view.layoutIfNeeded()
        },
                       completion: { _ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint,
                             &self.nextQuestionLabelCenterXConstraint)
                        
                        self.updateOffScreenLabel()
                        
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
    
    @IBAction func showAnswer(_ sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
        
    }
    
    func updateOffScreenLabel() {
        let screenwidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenwidth
    }
    
}

