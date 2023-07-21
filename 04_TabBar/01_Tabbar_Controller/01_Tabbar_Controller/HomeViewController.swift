//
//  HomeViewController.swift
//  01_Tabbar_Controller
//
//  Created by Dux on 21/07/2023.
//

import UIKit
import WebKit

class HomeViewController: UIViewController {
    
   
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let url = URL(string: "https://www.javatpoint.com/") else {return}
        webView.load(URLRequest(url: url))
    }
}
