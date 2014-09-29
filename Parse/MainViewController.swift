//
//  MainViewController.swift
//  Parse
//
//  Created by tsmsogn on 2014/09/28.
//  Copyright (c) 2014年 tsmsogn. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var logoutButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() == nil {
            println("not log in")
            self.performSegueWithIdentifier("go_to_login", sender: self)
        } else {
            println("log in")
        }
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        PFUser.logOut()
        self.performSegueWithIdentifier("go_to_login", sender: self)
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
