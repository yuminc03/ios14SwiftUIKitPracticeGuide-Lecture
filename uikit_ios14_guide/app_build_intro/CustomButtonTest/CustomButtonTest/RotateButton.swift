//
//  RotateButton.swift
//  CustomButtonTest
//
//  Created by yumin chu on 2022/03/13.
//

import UIKit

enum RotateType {
    case up
    case down
}

class MyButton {
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    init(frame: CGRect) {
        
    }
    
    required init(coder: NSCoder) {
        
    }
}

class CustomButton: MyButton {
   
    init() {
        super.init(frame: .zero) // MyButton에 있는 conveninence init()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class RotateButton: UIButton {

    init() {
        super.init(frame: .zero)
        self.configuration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configuration()
    }
    
    var isUp = RotateType.down {
        didSet {
            changeDesignButton()
        }
    }
    
    var selectTypeCallBack: ((RotateType) -> Void)?
    
    
    func configuration() {
        self.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    private func changeDesignButton() {
        
        UIView.animate(withDuration: 0.25, animations: {
            
            if self.isUp == RotateType.up {
                
                self.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.3)
            }
            else {
                
                self.imageView?.transform = .identity
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
            }
            
        }, completion: nil)
    }
    
    @objc private func buttonDidTapped(sender: UIButton) {
        
        if isUp == .up {
            isUp = .down
        }
        else {
            isUp = .up
        }
        
        selectTypeCallBack?(isUp)
    }
    
}
