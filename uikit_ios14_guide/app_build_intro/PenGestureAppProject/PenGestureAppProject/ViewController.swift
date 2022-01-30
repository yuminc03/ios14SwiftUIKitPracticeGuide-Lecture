//
//  ViewController.swift
//  PenGestureAppProject
//
//  Created by Chu Yu Min on 2022/01/30.
//

import UIKit

enum DragType {
    case dragX
    case dragY
    case none
}
class ViewController: UIViewController {

    var dragType = DragType.none
    let figure = DraggableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        figure.center = self.view.center
        
        figure.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        figure.dragType = .dragX
        figure.backgroundColor = .systemBlue
        figure.layer.cornerRadius = figure.bounds.height / 2
        
        self.view.addSubview(figure)
    }

    @IBAction func segmentedDidTapped(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            dragType = .dragX
            
        case 1:
            dragType = .dragY
            
        case 2:
            dragType = .none
            
        default:
            break
        }
        
        figure.dragType = self.dragType
    }
    
}

