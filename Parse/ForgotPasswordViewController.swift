//
//  ForgotPasswordViewController.swift
//  Parse
//
//  Created by tsmsogn on 2014/09/28.
//  Copyright (c) 2014年 tsmsogn. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet var usernameTextField : UITextField!
    @IBOutlet var resetButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUsername() -> String? {
        return usernameTextField.text
    }
    
    @IBAction func resetButtonPressed(sender : AnyObject) {
        PFUser.requestPasswordResetForEmailInBackground(getUsername(), block: { (succeeded, error) -> Void in
            if error == nil {
                var alert = UIAlertController(title: "Success", message: "An email was successfully sent with reset instructions.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: {
                    (ACTION: UIAlertAction!) in
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                let errorString = error.userInfo?["error"] as NSString
                var alert = UIAlertController(title: "Error", message: errorString, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: {
                    (ACTION: UIAlertAction!) in
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
