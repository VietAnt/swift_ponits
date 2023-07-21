//
//  ViewController.swift
//  01_Table_View
//
//  Created by Dux on 18/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSourceArr = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        dataSourceArr = ["Python", "JavaScript", "Java", "Swift", "GoLang", "C++", "C#","R"]
    }
}

extension ViewController: UITableViewDelegate{}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSourceArr[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
}
