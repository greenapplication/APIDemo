//
//  ImageUploadVC.swift
//  APIDemo
//
//  Created by Jack on 24/07/16.
//  Copyright © 2016 Wednesday Technology. All rights reserved.
//

import UIKit

class ImageUploadVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
     //image upload code
     func myImageUploadRequest()
     {
     MBProgressHUD.showHUDAddedTo(self.view, animated: true)
     //income
     let myUrl = NSURL(string: "https://www.yismach.com/androidapi/upload_image.php?");
     
     let request = NSMutableURLRequest(URL:myUrl!);
     request.HTTPMethod = "POST";
     
     let client_id = "\(NSUserDefaults.standardUserDefaults().valueForKey("client_id")!)"
     
     
     let param = [
     "id":"\(client_id)"]
     
     let boundary = generateBoundaryString()
     
     request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
     
     if(iData == "")  { return; }
     
     request.HTTPBody = createBodyWithParameters(param, filePathKey: "uploaded_file", imageDataKey: iData, boundary: boundary)
     
     let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
     data, response, error in
     
     if error != nil {
     print("error=\(error)")
     return
     }
     // You can print out response object
     print("******* response = \(response)")
     
     // Print out reponse body
     let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
     print("****** response data = \(responseString!)")
     
     dispatch_async(dispatch_get_main_queue(), {
     MBProgressHUD.hideHUDForView(self.view, animated: true)
     })
     }
     task.resume()
     }
     func generateBoundaryString() -> String {
     return "Boundary-\(NSUUID().UUIDString)"
     }
     func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
     let body = NSMutableData();
     
     if parameters != nil {
     for (key, value) in parameters! {
     body.appendString4("--\(boundary)\r\n")
     body.appendString4("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
     body.appendString4("\(value)\r\n")
     }
     }
     let filename = "user-profile.jpg"
     let mimetype = "image/jpg"
     body.appendString4("--\(boundary)\r\n")
     body.appendString4("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
     body.appendString4("Content-Type: \(mimetype)\r\n\r\n")
     body.appendData(imageDataKey)
     body.appendString4("\r\n")
     body.appendString4("--\(boundary)--\r\n")
     
     return body
     }
     
     extension NSMutableData {
     
     func appendString4(string: String) {
     let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
     appendData(data!)
     }
     
     }
    */

}
