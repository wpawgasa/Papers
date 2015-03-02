//
//  PageFiveController.swift
//  MyNavDemo
//
//  Created by สมเกียรติ ไกรสินธุ์ on 26/1/58.
//  Copyright (c) พ.ศ. 2558 DTI. All rights reserved.
//

import UIKit

class PageFiveController: UIViewController,UITableViewDataSource ,UITableViewDelegate{

    var mDataArray:NSArray=NSArray()
    @IBOutlet var mTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets=false;

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        let urlPath:String="http://localhost/carData.json"
        var url:NSURL=NSURL(string:urlPath)!
        var request:NSURLRequest=NSURLRequest(URL:url)
        let queue:NSOperationQueue=NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data,error) -> Void in
            var tmp:NSString = NSString(data: data, encoding: NSUTF8StringEncoding)!
            println(tmp)
            self.mDataArray=NSJSONSerialization.JSONObjectWithData(data , options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
            self.mTableView.reloadData()
            
            
            
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cellIndextifier="cell"
        var cell:UITableViewCell?=tableView.dequeueReusableCellWithIdentifier(cellIndextifier) as UITableViewCell?
        if(cell==nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: cellIndextifier)
        }
        var item:NSDictionary=self.mDataArray.objectAtIndex(indexPath.row) as NSDictionary
        cell?.textLabel?.text=item.objectForKey("title") as NSString
        cell?.detailTextLabel?.text=item.objectForKey("description") as NSString
        var imageURL:NSString=item.objectForKey("image") as NSString
        cell?.imageView?.sd_setImageWithURL(NSURL(string:imageURL),placeholderImage:UIImage(named: "loadinging.png"))
        
        return cell!
        
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
