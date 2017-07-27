//
//  RecordManager.swift
//  NumberTouchGame
//
//  Created by dadong on 2017. 7. 26..
//  Copyright © 2017년 dadong. All rights reserved.
//

import Foundation

class RecordManager {

    var timer: Timer!
    var second: Double
    var minute: Double
    
    init() {
        timer = Timer()
        second = 0
        minute = 0
    }
    
    public func startTimer(timerDidChange: @escaping (_ seoncd: Double) -> ()) {
        self.resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (titmer) in
            self.second += 0.01
            
            timerDidChange(self.second)
        })
    }
    
    public func stopTimer() {
        self.timer.invalidate()
    }
    
    public func resetTimer() {
        self.second = 0
    }
    
    public func addTime(for second: Double) {
    
        self.second += second
    }


}
