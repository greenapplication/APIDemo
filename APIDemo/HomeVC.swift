//
//  HomeVC.swift
//  APIDemo
//
//  Created by Jack on 24/07/16.
//  Copyright © 2016 Wednesday Technology. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblView: UITableView!
    
    var arrayOfNames:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: tableview delegate method
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNames.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = arrayOfNames[indexPath.row]
        
        return cell
    }
    
    
    
    func getData(){
        
        SVProgressHUD.showWithStatus("Loading")
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        manager.GET("https://www.yismach.com/androidapi/getallshadchan.php?",
                    parameters: nil, progress:nil,
                    success: {
                        
                        operation, responseObject in
                        
                        var json :AnyObject!
                        
                        json = (try! NSJSONSerialization.JSONObjectWithData(responseObject as! NSData, options: NSJSONReadingOptions.MutableContainers)) as! Dictionary<String, AnyObject>
                        
                        if json["success"] as! Int == 1
                        {
                            
                            let col = json["shadchaninfo"]as! NSArray
                            
                            for json in col{
                                
                                if json["fname"]is String{
                                    if json["fname"] != nil{
                                        self.arrayOfNames.append(json["fname"]as! String)
                                    }
                                }
                            }
                            self.tblView.reloadData()
                            
                        }else{
                            alrt("", message: "failed to fetch record..")
                            SVProgressHUD.dismiss()
                        }
                        
            },
                    failure: {
                        operation, error in
                        print("Error: " + error.localizedDescription)
                        
        })
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
