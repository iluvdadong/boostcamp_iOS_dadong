//
//  DrawView.swift
//  TouchTracker
//
//  Created by dadong on 2017. 7. 25..
//  Copyright © 2017년 dadong. All rights reserved.
//

import Foundation
import UIKit

class DrawView: UIView {

    var currentLines = [NSValue:Line]()
    var finishedLines = [Line]()
    
    func stroke(_ line: Line) {
        let path = UIBezierPath()
        path.lineWidth = 10
        path.lineCapStyle = .round
    
        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        //Draw finished lines in black
        UIColor.black.setStroke()
        for line in finishedLines {
            stroke(line)
        }
        
        if let line = currentLine {
        // If there is a line currently being drawn, do it in red
            UIColor.red.setStroke()
            stroke(line)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // log statement to see the order of events
        print(#function)
        
        for touch in touches {
        
            let location = touch.location(in: self)
            
            let newLine = Line
        }
        
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        currentLine?.end = location
        setNeedsDisplay()
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if var line = currentLine {
            let touch = touches.first!
            let location = touch.location(in: self)
            line.end = location
            
            finishedLines.append(line)
        }
        
        currentLine = nil
        setNeedsDisplay()
    }
    
    
}
