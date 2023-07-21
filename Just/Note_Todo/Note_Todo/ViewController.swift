//
//  ViewController.swift
//  Note_Todo
//
//  Created by Dux on 19/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var doneButton : UIBarButtonItem?
    
    var tasks = [Task](){
        didSet{
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.doneButton?.tintColor = .darkGray
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }
    
    //Done_Button
    @objc func doneButtonTap(){
        self.navigationItem.leftBarButtonItem = editButton
        self.tableView.setEditing(false, animated: true)
    }
    
    //Edit_Button
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    //Add_Button
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        //Alert
        let alert = UIAlertController(title: "Làm gì hôm nay? 🐜", message: nil, preferredStyle: .alert)
        
        //Register_Button
        let registerButton = UIAlertAction(title: "Yes", style: .default, handler: { [weak self]_ in
            // debugPrint("\(alert.textFields?[0].text)")
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })
        
        //Cancel_Button
        let cancelButton = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Hãy nhập nhiệm vụ của con kiến.:)"
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    //Save_Tasks
    func saveTasks() {
        let data = self.tasks.map{
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    //Load_Task
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else {return nil}
            guard let done = $0["done"] as? Bool else {return nil}
            return Task(title: title, done: done)
        }
    }
}

extension ViewController: UITableViewDataSource {
    // UITableViewDataSource protocol : Bạn phải xác định hai hàm sau để sử dụng
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // numberOfRowsInSection : Số lượng hàng để hiển thị trong mỗi phần
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty {
            self.doneButtonTap()
        // Thoát khỏi chế độ chỉnh sửa khi tất cả các ô bị xóa
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true  // có thể sắp xếp lại
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // table cell : Với thứ tự được sắp xếp lại này, mảng lưu trữ các todos cũng được sắp xếp lại
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row] // Truy cập đường dẫn chỉ mục của một mảng
        tasks.remove(at: sourceIndexPath.row) // Xóa việc cần làm ban đầu
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks //Vượt qua một mảng được sắp xếp lại.
    }
}

/*
cellForRowAt : Một hàm trả về các ô cần thiết để vẽ hàng thứ n của một phần cụ thể
Một phương thức trả về một đối tượng xem bảng có thể tái sử dụng và thêm nó vào chế độ xem bảng
Tái sử dụng ô bằng cách sử dụng hàng đợi! Tái sử dụng để tránh lãng phí bộ nhớ
Trong quá trình cuộn xuống, 100 triệu dữ liệu có thể được biểu thị trong 5 ô thông qua việc tái sử dụng các ô
Mục tiêu sử dụng lại được tìm kiếm thông qua mã định danh withIdentifier và việc sử dụng được tiếp tục thông qua indexPath.
 */

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
