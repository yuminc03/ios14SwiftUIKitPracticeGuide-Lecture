//
//  OnBoardingItemViewController.swift
//  OnBoardingViewApp
//
//  Created by Chu Yu Min on 2022/01/31.
//

import UIKit

class OnBoardingItemViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var imageName: String?
    var pageTitle: String?
    var pageDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        topImageView.image = UIImage(named: imageName ?? "")
        mainTitleLabel.text = pageTitle
        descriptionLabel.text = pageDescription
    }
    
    func setText(image: String, title: String, description: String) {
        
        imageName = image
        pageTitle = title
        pageDescription = description
        
    }
}
