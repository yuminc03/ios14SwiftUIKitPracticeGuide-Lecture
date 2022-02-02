//
//  OnBoardingPageViewController.swift
//  OnBoardingViewApp
//
//  Created by Chu Yu Min on 2022/01/31.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {

    let contents = "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain flowering plants in the Coffea genus. From the coffee fruit, the seeds are separated to produce a stable, raw product: unroasted green coffee. The seeds are then roasted, a process which transforms them into a consumable product: roasted coffee, which is ground into fine particles that are typically steeped in hot water before being filtered out, producing a cup of coffee."
    let startIndex = 0
    var pages = [UIViewController]()
    var bottomButtonMargin: NSLayoutConstraint?
    var pagingView = UIPageControl() //현재 page의 위치를 알려주는 view
    var currentIndex = 0 {
        didSet {
            pagingView.currentPage = currentIndex
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setBottomButton()
        setPagingView()
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
        
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([firstItemVc], direction: .forward, animated: true, completion: nil)
    }
    
    private func setBottomButton() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(bottomButtonDidTapped), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomButtonMargin?.isActive = true
    
        hideButton()
    }
    
    func setPagingView() {
        view.addSubview(pagingView)
        pagingView.translatesAutoresizingMaskIntoConstraints = false
        pagingView.currentPageIndicatorTintColor = .black //현재 선택한 view의 색
        pagingView.pageIndicatorTintColor = .lightGray //선택되지 않은 view의 색
        pagingView.numberOfPages = pages.count
        pagingView.currentPage = startIndex
//        pagingView.isUserInteractionEnabled = false //pagingView를 클릭하지 못하게 함
        
        NSLayoutConstraint.activate([
            pagingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            pagingView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        pagingView.addTarget(self, action: #selector(pagingViewDidTapped), for: .valueChanged)
    }
    
    @objc private func bottomButtonDidTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func pagingViewDidTapped(sender: UIPageControl) {
        if sender.currentPage > self.currentIndex {
            setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
        else {
            setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        }
        
        currentIndex = sender.currentPage
        
        bottomButtonPresent()
    }
    
    func bottomButtonPresent() {
        if currentIndex == pages.count - 1 {
            showButton()
        }
        else {
            hideButton()
        }

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
}
