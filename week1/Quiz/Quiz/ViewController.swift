//
//  ViewController.swift
//  Quiz
//
//  Created by DaHye on 2017. 7. 3..
//  Copyright © 2017년 Dadong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!

    
    let questions: [String] = ["김다동이 사는 곳은?",
                               "what is 7+7",
                               "what is thr capital of Vermont?"]
    
    let answers: [String] = ["정자동",
                             "14",
                             "Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    
    
    @IBAction func showNextQuestion(sender: AnyObject) {
    currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }

}

