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

    //    var tmp=NSLocalizedString("MY_WS_REQUEST",comment:"comment")
    //    var _soapMsg=String(format:"\(tmp)",self.mUsernameField.text)
    //    println(_soapMsg)
        
    //    println("onConnectWebservice")
        
        var tmp = NSLocalizedString("MY_WS_REQUEST", comment: "comment")
        
        var soapMsg  = String(format: "\(tmp)", self.mUsernameField.text, self.mPasswordTextField.text)
        
        let wsSoapAction = "urn:authenwsdl#authen"
        
        
        
        var url:NSURL = NSURL(string: "http://www.codemobiles.com/nusoap/samples/authentication_ws.php")!
        
        var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        let msgLength = String(format: "%tu",soapMsg.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.addValue(wsSoapAction, forHTTPHeaderField: "SOAPAction")
        
        request.addValue(msgLength, forHTTPHeaderField: "Content-Length")
        
        request.HTTPMethod = "POST"
        
        request.HTTPBody = soapMsg.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        var queue:NSOperationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) -> Void in
        var result:NSString? = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(result)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.parseXML(data!)
            })
        //selft.parseXML(result)
            
        }
        
        

    }
    @IBAction func onConnectPTT(sender: AnyObject) {
        
        //    var tmp=NSLocalizedString("MY_WS_REQUEST",comment:"comment")
        //    var _soapMsg=String(format:"\(tmp)",self.mUsernameField.text)
        //    println(_soapMsg)
        
          println("onConnect PTT ")
        
        var soapMsg = NSLocalizedString("MY_PTT_WS", comment: "comment")
        
     //   var soapMsg  = String(format: "\(tmp)", self.mUsernameField.text, self.mPasswordTextField.text)
        
        let wsSoapAction = "http://www.pttplc.com/ptt_webservice/CurrentOilPrice"

        
        var url:NSURL = NSURL(string: "http://www.pttplc.com/webservice/pttinfo.asmx")!
        
        var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        let msgLength = String(format: "%tu",soapMsg.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.addValue(wsSoapAction, forHTTPHeaderField: "SOAPAction")
        
        request.addValue(msgLength, forHTTPHeaderField: "Content-Length")
        
        request.HTTPMethod = "POST"
        
        request.HTTPBody = soapMsg.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        var queue:NSOperationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) -> Void in
            var result:NSString? = NSString(data: data, encoding: NSUTF8StringEncoding)
            println(result)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.parseXML(data!)
            })
            //selft.parseXML(result)
            
        }
        
        
        
    }

    func parseXML(xmlData:NSData)
    {
        var xmlError:NSError?
        
        var xmlDoc:SMXMLElement = SMXMLDocument(data: xmlData, error: &xmlError)
        
        var res:SMXMLElement = xmlDoc.childNamed("Body").childNamed("authenResponse").childNamed("return")
        
        self.mResultLabel.text = res.value
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
