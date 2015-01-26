//
//  PageSixViewController.swift
//  MyNavDemo
//
//  Created by สมเกียรติ ไกรสินธุ์ on 26/1/58.
//  Copyright (c) พ.ศ. 2558 DTI. All rights reserved.
//

import UIKit

class PageSixViewController: UIViewController ,UITextFieldDelegate{

 
    @IBOutlet weak var mTextField: UITextView!
    @IBOutlet weak var mPassword: UITextField!
    @IBOutlet weak var mUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func OnConnect(sender: AnyObject) {
        //self.mTextField.text="55"
        var tmp=NSLocalizedString("MY_WS_REQUEST",comment:"comment")
        var _soapMsg=String(format:"\(tmp)",self.mTextField.text)
        println(_soapMsg)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.mUsername.resignFirstResponder()
        self.mPassword.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
