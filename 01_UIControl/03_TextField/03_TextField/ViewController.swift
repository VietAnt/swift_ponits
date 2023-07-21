//
//  ViewController.swift
//  03_TextField
//
//  Created by Dux on 18/07/2023.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    
    @IBOutlet weak var sbmtLbl: UILabel!
    @IBOutlet weak var createUserSuccessView: UIView!
    @IBOutlet weak var messageNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setInitViews()
        sbmtLbl.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(sbmtBtnTapped(sender:)))
        sbmtLbl.addGestureRecognizer(tap)
    }

            func setInitViews(){
                nameTextField.becomeFirstResponder()
                emailTextFiled.delegate = self
                mobileTextField.delegate = self
                nameTextField.delegate = self
                passTextField.delegate = self
            }
    
    @objc func sbmtBtnTapped(sender: UITapGestureRecognizer){
        if(nameTextField.text?.isEmpty ?? false || emailTextFiled.text?.isEmpty ?? false || passTextField.text?.isEmpty ?? false || mobileTextField.text?.isEmpty ?? false ){
            //---let
            let alert = UIAlertController(title: nil, message: "Please fill the details", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default){(action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else{
            messageNameLbl.text = " HI " + (nameTextField.text ?? "")
            createUserSuccessView.isHidden = false
        }
    }
}


extension ViewController:UITextFieldDelegate{
    func textField(_ textField:UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if(textField == mobileTextField){
            let currentCharacterCount = textField.text?.count ?? 0
            if range.length + range.location > currentCharacterCount{
                return false
            }
            let newLength = currentCharacterCount + string.count - range.length
            return newLength <= 10
        }else{
            return true
        }
        
    }
}
