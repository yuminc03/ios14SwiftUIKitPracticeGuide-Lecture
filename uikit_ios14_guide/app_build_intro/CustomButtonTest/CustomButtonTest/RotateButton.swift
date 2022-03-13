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
class RotateButton: UIButton {

    var isUp = RotateType.down {
        didSet {
            changeDesignButton()
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.configuration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configuration() {
        self.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    private func changeDesignButton() {
        
        if isUp == RotateType.down {
            
            self.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.3)
        }
        else {
            
            self.imageView?.transform = .identity
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
        }
        
    }
    
    @objc private func buttonDidTapped(sender: UIButton) {
        
        if isUp == .up {
            isUp = .down
        }
        else {
            isUp = .up
        }
    }
    
}
