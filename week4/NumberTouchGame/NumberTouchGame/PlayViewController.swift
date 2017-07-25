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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    @IBAction func closePlayView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func removeNumber(_ sender: UIButton) {
        if let title = sender.currentTitle, let value = Int(title) {
            if value == currentTargetNumber {
                sender.isHidden = true
            } else {
                //시간증가
            }
            
            //25까지 다 찾았는지 확인하고 종료
        }
    }


}
