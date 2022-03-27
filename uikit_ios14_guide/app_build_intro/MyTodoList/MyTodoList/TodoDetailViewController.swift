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
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    let appDelegateViewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    weak var delegate: TodoDetailViewControllerDelegate? = nil
    var priority: PriorityLevel?
    var selectedTodoList: MyTodoList?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let hasData = selectedTodoList { //데이터를 수정할 때
            
            titleTextField.text = hasData.title
            priority = PriorityLevel(rawValue: hasData.priorityLevel)
            
            makePriorityButtonDesign()
            
            saveButton.setTitle("Update", for: .normal)
            deleteButton.isHidden = false
        }
        else { //데이터를 새로 만들 때
            
            saveButton.setTitle("Save", for: .normal)
            deleteButton.isHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = normalButton.bounds.height / 2
        highButton.layer.cornerRadius = highButton.bounds.height / 2
    }
    
    func makePriorityButtonDesign() {
        
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear
        
        switch self.priority {
        case .level1:
            lowButton.backgroundColor = priority?.color
            
        case .level2:
            normalButton.backgroundColor = priority?.color
            
        case .level3:
            highButton.backgroundColor = priority?.color
            
        default:
            return
        }
    }
    
    func saveMyTodo() {
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "MyTodoList", in: appDelegateViewContext) else { return }
        
        //todoList에서 key, value형태로 가져온다
        guard let object = NSManagedObject(entity: entityDescription, insertInto: appDelegateViewContext) as? MyTodoList else {
             return
        }
        
        object.title = titleTextField.text
        object.date = Date() //저장한 순간의 날짜
        object.uuid = UUID()
        
        object.priorityLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
        
    }
    
    func updateMyTodo() {
        
        guard let hasData = selectedTodoList else { return }
        guard let hasUUID = hasData.uuid else { return }
        
        let fetchRequest: NSFetchRequest<MyTodoList> = MyTodoList.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg) //selectedTodoList에서 uuid만 가져와서 사용
        
        do {
            let loadedData = try appDelegateViewContext.fetch(fetchRequest)
            
            loadedData.first?.title = titleTextField.text
            loadedData.first?.date = Date()
            loadedData.first?.priorityLevel = self.priority?.rawValue ?? PriorityLevel.level1.rawValue
            
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            appDelegate.saveContext()
            
            
        } catch {
            print(error)
        }
        
    }
    
    func deleteMyTodo() {
        
        guard let hasData = selectedTodoList else { return }
        guard let hasUUID = hasData.uuid else { return }
        
        let fetchRequest: NSFetchRequest<MyTodoList> = MyTodoList.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            
            let loadedData = try appDelegateViewContext.fetch(fetchRequest)
            
            if let hasData = loadedData.first {
                self.appDelegateViewContext.delete(hasData)
            }
        }
        catch {
            print(error)
        }
        if delegate != nil {
            
            delegate?.didFinishSaveData()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func priorityButtonDidTapped(_ sender: UIButton) {
        
        switch sender.tag {
            
        case 1:
            priority = .level1
        case 2:
            priority = .level2
        case 3:
            priority = .level3
        default:
            break
        }
        
        makePriorityButtonDesign()
        
    }
    
    @IBAction func saveButtonDidTapped(_ sender: Any) {

        if selectedTodoList != nil {
            updateMyTodo()
        }
        else {
            saveMyTodo()
        }

        if delegate != nil {
            
            delegate?.didFinishSaveData()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonDidTapped(_ sender: Any) {
        deleteMyTodo()
    }
    
}

extension TodoDetailViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
