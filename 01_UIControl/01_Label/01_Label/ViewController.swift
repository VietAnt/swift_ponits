//
//  ViewController.swift
//  01_Label
//
//  Created by Dux on 17/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLbl: UILabel!
    var didTap = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textLbl.text = "Hello World"
        textLbl.font = .italicSystemFont(ofSize: 20)
        textLbl.backgroundColor = UIColor.blue
        textLbl.textAlignment = .center
        textLbl.textColor = UIColor.white
        textLbl.shadowColor = UIColor.black
        textLbl.isHighlighted = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTextLabelTap(sender:)))
        textLbl.isUserInteractionEnabled = true
        textLbl.addGestureRecognizer(tap)
    }

    @objc func didTextLabelTap(sender: UITapGestureRecognizer){
        if(didTap){
            textLbl.backgroundColor = UIColor.brown
            didTap = false
        }else{
            textLbl.backgroundColor = UIColor.blue
            didTap = true
        }
    }

}

