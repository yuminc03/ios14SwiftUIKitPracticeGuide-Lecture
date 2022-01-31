//
//  OnBoardingPageViewControllerExtensions.swift
//  OnBoardingViewApp
//
//  Created by Chu Yu Min on 2022/01/31.
//

import UIKit

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
                
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        }
        else {
            return pages[currentIndex - 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == pages.count - 1 {
            return pages.first
        }
        else {
            return pages[currentIndex + 1]
        }
        
    }
    
}
