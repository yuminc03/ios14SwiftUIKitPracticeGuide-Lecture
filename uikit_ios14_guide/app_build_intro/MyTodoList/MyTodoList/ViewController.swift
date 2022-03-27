//
//  ViewController.swift
//  MyTodoList
//
//  Created by Chu Yu Min on 2022/03/01.
//

import UIKit
import CoreData

enum PriorityLevel: Int64 {
    case level1
    case level2
    case level3
}

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var myTodoList = [MyTodoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.title = "My to do List"
        setNavigationButton()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.separatorStyle = .none
        
        fetchData()
        todoTableView.reloadData()
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<MyTodoList> = MyTodoList.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            self.myTodoList = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    func setNavigationButton() {
        
        let rightItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightButtonDidTapped))
        rightItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightItem
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .systemPurple.withAlphaComponent(0.6)
        self.navigationController?.navigationBar.standardAppearance = barAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
    }
    
    @objc private func rightButtonDidTapped() {
        
        let vc = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
}
