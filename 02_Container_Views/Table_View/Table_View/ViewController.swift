//
//  ViewController.swift
//  Table_View
//
//  Created by Dux on 18/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var imgArr = ["Product1","Product2","Product3","Product4","Product5","Product6","Product7","Product8"]
    var lblTextArr = ["Powerbanks","Storage Devices","LED Bulbs","Laptop Bags","Keyboards","Routers","Shoes"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}


extension ViewController : UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count - 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.titleImg?.image = UIImage(named: imgArr[indexPath.row])
        cell.titleLbl.text = lblTextArr[indexPath.row]
        return cell
    }
}

extension UIViewController : UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}

