//
//  TodoDetailViewController.swift
//  MyTodoList
//
//  Created by Chu Yu Min on 2022/03/13.
//

import UIKit
import CoreData

protocol TodoDetailViewControllerDelegate: AnyObject {
    func didFinishSaveData()
}
class TodoDetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    
    weak var delegate: TodoDetailViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func priorityButtonDidTapped(_ sender: UIButton) {
        
        switch sender.tag {
            
        case 1:
            break
        case 2:
            break
        case 3:
            break
            
        default:
            break
        }
    }
    
    @IBAction func saveButtonDidTapped(_ sender: Any) {
        
        let appDelegateViewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "MyTodoList", in: appDelegateViewContext) else { return }
        
        //todoList에서 key, value형태로 가져온다
        guard let object = NSManagedObject(entity: entityDescription, insertInto: appDelegateViewContext) as? MyTodoList else {
             return
        }
        
        object.title = titleTextField.text
        object.date = Date() //저장한 순간의 날짜
        object.uuid = UUID()
        
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
        
        if delegate != nil {
            
            delegate?.didFinishSaveData()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonDidTapped(_ sender: Any) {
        
    }
    
    
}
