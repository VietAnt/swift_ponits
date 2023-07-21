//
//  JavaViewController.swift
//  01_Tabbar_Controller
//
//  Created by Dux on 21/07/2023.
//

import UIKit
import WebKit

class JavaViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let url = URL(string: "https://www.javatpoint.com/java-tutorial") else {return}  
        webView.load(URLRequest(url: url))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
