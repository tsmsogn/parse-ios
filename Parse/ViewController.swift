//
//  ViewController.swift
//  Parse
//
//  Created by tsmsogn on 2014/09/28.
//  Copyright (c) 2014年 tsmsogn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usernameTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    @IBOutlet var signInButton : UIButton!
    @IBOutlet var signUpButton : UIButton!
    @IBOutlet var forgotPasswordLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonPressed(sender : AnyObject) {
        PFUser.logInWithUsernameInBackground(getUsername(), password: getPassword()) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                // Do stuff after successful login.
                self.performSegueWithIdentifier("go_to_main", sender: self)
            } else {
                // The login failed. Check error to see why.
                let errorString = error.userInfo?["error"] as NSString
                var alert = UIAlertController(title: "Error", message: errorString, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: {
                    (ACTION: UIAlertAction!) in
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func signUpButtonPressed(sender : AnyObject) {
        var user = PFUser()
        user.username = getUsername()
        user.password = getPassword()
        user.email = getUsername()
        user.signUpInBackgroundWithBlock {
            (succeeded : Bool!, error : NSError!) -> Void in
            if error == nil {
                PFUser.logInWithUsername(user.username, password: user.password)
                self.performSegueWithIdentifier("go_to_main", sender: self)
            } else {
                let errorString = error.userInfo?["error"] as NSString
                var alert = UIAlertController(title: "Error", message: errorString, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: {
                    (ACTION: UIAlertAction!) in
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func forgotPasswordButtonPressed(sender: AnyObject) {
        
    }
    
    func getUsername() -> String {
        return usernameTextField.text
    }
    
    func getPassword() -> String {
        return passwordTextField.text
    }

}

