//
//  LoginVC.swift
//  APIDemo
//
//  Created by Jack on 24/07/16.
//  Copyright © 2016 Wednesday Technology. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonLogin(sender: AnyObject) {
        
        //shmuelneumann
        //Starbuck5
        if txtUsername.text == "" || txtPassword.text == "" {
            
          alrt("", message: "Please enter username or password")
            
        }else{
            
            SVProgressHUD.showWithStatus("Loading")
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue(), { ()->() in
                // your long running code here
                
                let myqueue: dispatch_queue_t = dispatch_queue_create("queue", nil)
                dispatch_async(myqueue, {
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        if Reachability.isConnectedToNetwork() {
                            self.view.endEditing(true)
                            self.getdata(self.txtUsername.text!, password: self.txtPassword.text!)
                        }else{
                            SVProgressHUD.dismiss()
                            alrt("No Internet Connection", message: "Make sure your device is connected to the internet.")
                        }
                    });
                });
            })
        }
    }
    
    func getdata(username:String, password: String)
    {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.responseSerializer = AFHTTPResponseSerializer()
        let param = ["txtUsername":"\(username)","txtPassword":"\(password)"]
        manager.POST("https://yismach.com/androidapi/login_common.php?",
                    parameters: param, progress:nil,
                    success: {
                        
                        operation, responseObject in
                        
                        var json :AnyObject!
                        
                        json = (try! NSJSONSerialization.JSONObjectWithData(responseObject as! NSData, options: NSJSONReadingOptions.MutableContainers)) as! Dictionary<String, AnyObject>
                        
                        print(json)
                        
                        if json["success"] as! Int == 1
                        {
                            let nextVC=self.storyboard?.instantiateViewControllerWithIdentifier("HomeVC")as! HomeVC
                            self.navigationController?.pushViewController(nextVC, animated: true)
                            
                        }else{
                            alrt("Failed to login", message: "Please try again.")
                            SVProgressHUD.dismiss()
                        }
                        SVProgressHUD.dismiss()
                        
            },
                    failure: {
                        operation, error in
                        print("Error: " + error.localizedDescription)
                        SVProgressHUD.dismiss()
                        
        })
        
        
    }
    
   
}
