//
//  PlayViewController.swift
//  NumberTouchGame
//
//  Created by dadong on 2017. 7. 25..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    var currentTargetNumber: Int = 1
    var numberOfSquare: Int = 5
    
    @IBOutlet var numberVerticalStackView: UIStackView!
    @IBOutlet var TimeLabel: UILabel!
    
    var recordManager: RecordManager = RecordManager()
    
    var startButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func gernerateRandomNumbers() -> Void {
        self.currentTargetNumber = 1
        
        let horizontals: [UIStackView] = numberVerticalStackView.arrangedSubviews as! [UIStackView]
    
        let randomNumbers: [Int] = RandomNumberGernerator.generateRandomNumbers(from: 1, to: 25)
        
        for (i, horizontalStackView) in horizontals.enumerated() {
            let buttons: [UIButton] = horizontalStackView.arrangedSubviews as! [UIButton]
            
            for (j, button) in buttons.enumerated() {
                button.setTitle("\(randomNumbers[(i*5)+j])", for: .normal)
                button.layer.cornerRadius = 12
                button.backgroundColor = UIColor.blue
                button.alpha = 1
                button.setTitleColor(.white, for: .normal)
                button.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
            }
        
        }
    
        numberVerticalStackView.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.numberVerticalStackView.alpha = 1
        }
    
        recordManager.startTimer { (second) in self.TimeLabel.text = String(format: "%.2f", second)
        }
    }
    
    //MARK: IBActions
    @IBAction func closePlayView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    public func tappedButton(_ sender: UIButton) {
        if let title = sender.currentTitle, let value = Int(title) {
            if value == currentTargetNumber {
                hideButton(target: sender)
                currentTargetNumber += 1
            } else {
                recordManager.addTime(for: 3)
            }
            if currentTargetNumber == 26 {
                coverStartButton()
                recordManager.stopTimer()
            }
        }
    
    }
    
    
    private func hideButton(taeget: UIButton) {
    
        UIView.animate(withDuration: 0.25) {
            target.alpha = 0
        }
        target.setTitle("", for: .normal)
        target.isUserInteractionEnabled = false
    }
    
    
    
    
    
    
    
    
    
  


}













