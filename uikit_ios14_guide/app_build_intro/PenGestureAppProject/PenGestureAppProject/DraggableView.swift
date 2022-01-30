//
//  DraggableView.swift
//  PenGestureAppProject
//
//  Created by Chu Yu Min on 2022/01/30.
//

import UIKit

class DraggableView: UIView {
    
    var dragType = DragType.none
    
    init() {
        super.init(frame: CGRect.zero)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func dragging(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            print("began")
            
        case .changed:
            let delta = pan.translation(in: self.superview) //translation = 움직인 만큼의 값을 알려줌
            //delta는 부모 view를 기준으로 자신이 움직인 값을 갖는다
            
            var figurePosition = self.center //도형의 가운데를 절대좌표로 정한다
            
            if dragType == .dragX {
                figurePosition.x += delta.x
            }
            else if dragType == .dragY {
                figurePosition.y += delta.y
            }
            else {
                figurePosition.x += delta.x //움직인 만큼 더함
                figurePosition.y += delta.y
            }
            
            self.center = figurePosition
            
            pan.setTranslation(CGPoint.zero, in: self.superview) //값을 초기화한다

        case .ended, .cancelled:
            print("ended cancelled")
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
                }
            }
            
        default:
            break
        }
    }
}
