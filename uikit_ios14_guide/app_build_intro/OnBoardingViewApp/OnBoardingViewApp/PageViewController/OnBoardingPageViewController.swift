//
//  OnBoardingPageViewController.swift
//  OnBoardingViewApp
//
//  Created by Chu Yu Min on 2022/01/31.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {

    var pages = [UIViewController]()
    let contents = "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain flowering plants in the Coffea genus. From the coffee fruit, the seeds are separated to produce a stable, raw product: unroasted green coffee. The seeds are then roasted, a process which transforms them into a consumable product: roasted coffee, which is ground into fine particles that are typically steeped in hot water before being filtered out, producing a cup of coffee."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView() {
        let firstItemVc = OnBoardingItemViewController(nibName: "OnBoardingItemViewController", bundle: nil)
        pages.append(firstItemVc)
        firstItemVc.setText(image: "coffee", title: "Coffee", description: contents)
        
        let secondItemVc = OnBoardingItemViewController(nibName: "OnBoardingItemViewController", bundle: nil)
        pages.append(secondItemVc)
        secondItemVc.setText(image: "keyring_2", title: "Resin art", description: contents)
        
        let thirdItemVc = OnBoardingItemViewController(nibName: "OnBoardingItemViewController", bundle: nil)
        pages.append(thirdItemVc)
        thirdItemVc.setText(image: "apple_watch", title: "Smart watch", description: contents)
        
        self.dataSource = self
        
        setViewControllers([firstItemVc], direction: .forward, animated: true, completion: nil)
    }
}
