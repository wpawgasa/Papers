//
//  PageTwoController.swift
//  MyNavDemo
//
//  Created by สมเกียรติ ไกรสินธุ์ on 26/1/58.
//  Copyright (c) พ.ศ. 2558 DTI. All rights reserved.
//

import UIKit

class PageTwoController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var mResultTextView: UITextView!
    @IBOutlet weak var mResultLabel: UILabel!
    @IBOutlet weak var mPasswordTextField: UITextField!
    @IBOutlet weak var mUsernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mUsernameField.text="somkheart"
        

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
   
        self.OnBackgroudClicked()
        return true;
    }
   
    @IBAction func onConnectWebservice(sender: AnyObject) {

        var tmp=NSLocalizedString("MY_WS_REQUEST",comment:"comment")
        var _soapMsg=String(format:"\(tmp)",self.mUsernameField.text)
        println(_soapMsg)

    }
    @IBAction func OnBackgroudClicked()
    {
        self.mUsernameField.resignFirstResponder()
        self.mPasswordTextField.resignFirstResponder()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  // Dispose of any resources that can be recreated.
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
