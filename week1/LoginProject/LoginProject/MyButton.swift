//
//  MyButton.swift
//  LoginProject
//
//  Created by dadong on 2017. 7. 19..
//  Copyright © 2017년 Dadong. All rights reserved.
//

import UIKit

@IBDesignable class MyButton: UIView {
    
    // MARK: View
    private var titleLabel: UILabel?
    private var backgroundImageView: UIImageView?
    private var previousState = UIControlState()
    
    // MARK: State
    private var state = UIControlState() {
        didSet {
            if state == .highlighted {
                if let titleLabel = self.titleLabel {
                    titleLabel.textColor = highlitedTextColor
                    titleLabel.text = "highlited"
                }
            } else {
                if let titleLabel = self.titleLabel {
                    UIView.transition(with: self.titleLabel!, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                        titleLabel.textColor = self.textColor.withAlphaComponent(1)
                    }, completion: nil)
                    
                    titleLabel.text = "normal"
                }
            }
        }
    }

    
    // MARK: Color
    @IBInspectable open var textColor: UIColor = UIColor.black {
        didSet {
            if let titleLabel = self.titleLabel {
                titleLabel.textColor = textColor
            }
        }
    }
    
    private var highlitedTextColor: UIColor {
        return textColor.withAlphaComponent(0.3)
    }
    
    // MARK: Text
    @IBInspectable private var title: String = "" {
        didSet {
            if let titleLabel = self.titleLabel {
                titleLabel.text = title
            } else {
                self.titleLabel = UILabel()
                self.titleLabel?.text = title
            }
        }
    }
    
    @IBInspectable open var textAlignment: NSTextAlignment = NSTextAlignment.center {
        didSet {
            guard titleLabel != nil else {
                return
            }
            
            titleLabel?.textAlignment = textAlignment
        }
    }
    
    
    // MARK: Methods
    open func setTitle(_ title: String) -> Void {
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        titleLabel?.text = title
        titleLabel?.textColor = textColor
        
        self.addSubview(titleLabel!)
    }
    
    open func setTitleColor(_ color: UIColor) {
        textColor = color
        
        // 이미 라벨이 존재하는 경우 라벨 색상 변경
        guard let titleLabel = self.titleLabel else {
            return
        }
        
        titleLabel.textColor = color
    }
    
    open func setBackgroundImage(_ image: UIImage?) -> Void {
        // 타이틀 라벨이 뒤에 가려지는 것을 방지하기 위해서 제거했다가 배경 이미지를 넣고 다시 추가
        if titleLabel != nil {
            titleLabel?.removeFromSuperview()
        }
        
        backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        self.addSubview(backgroundImageView!)
        
        if titleLabel != nil {
            self.addSubview(titleLabel!)
        }
        
        guard let image = image else {
            backgroundImageView?.backgroundColor = UIColor.blue
            return
        }
        
        backgroundImageView?.image = image
    }
    
    
    // MARK: initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.state = .normal
        self.previousState = .normal
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.state = .normal
        self.previousState = .normal
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        state = .highlighted
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        
        if previousState == UIControlState.selected {
            previousState == .normal
            state = .normal
        } else if previousState == UIControlState.normal {
            previousState = .selected
            state = .selected

        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }

}
