//
//  ViewController.swift
//  02_Button
//
//  Created by Dux on 17/07/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var mainView: UIView!
    var didTap = true
    @IBOutlet weak var changeBtnTapped: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeBtnTapped(_ sender: Any) {
        if(didTap){
            mainView.backgroundColor = .orange
            didTap = false
        }else{
            mainView.backgroundColor = .white
            didTap = true
        }
    }
    
}

