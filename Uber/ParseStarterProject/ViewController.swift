/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

@available(iOS 8.0, *)
class ViewController: UIViewController, UITextFieldDelegate {
    
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    var signUpState = true
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var riderLabel: UILabel!
    
    @IBAction func signUp(sender: AnyObject) {
        
        if username.text == "" || password.text == "" {
            displayAlert("Missing Field(s)", message: "Username and password are required")
            
        } else {
            
            if signUpState == true {
                
                let user = PFUser()
                user.username = username.text
                user.password = password.text
                
                user["isDriver"] = `switch`.on
                
                user.signUpInBackgroundWithBlock({ (succeeded, error) in
                    if let error = error {
                        if let errorString = error.userInfo["error"] as? String {
                    
                            self.displayAlert("Sign Up Failed", message: errorString)
                        }
                    
                    } else {
                        
                        if self.`switch`.on == true {
                            
                            self.performSegueWithIdentifier("loginDriver", sender: self)
                            
                        } else {
                            
                            self.performSegueWithIdentifier("loginRider", sender: self)
                            
                        }
                    }
                })
                
            } else {
                
                PFUser.logInWithUsernameInBackground(username.text!, password: password.text!, block: { (user, error) in
                    if let user = user {
                        
                        if  user["isDriver"]! as! Bool == true {
                            
                            self.performSegueWithIdentifier("loginDriver", sender: self)
                            
                        } else {
                            
                            self.performSegueWithIdentifier("loginRider", sender: self)
                            
                        }
                        
                    } else {
                        
                        if let errorString = error?.userInfo["error"] as? String {
                            
                            self.displayAlert("Login Failed", message: errorString)
                        }
                    }
                })
            }
        }
    }
    
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var toggleSignUpButton: UIButton!
    @IBAction func toggleSignUp(sender: AnyObject) {
        
        if signUpState == true {
            
            signUpButton.setTitle("Log In", forState: UIControlState.Normal)
            toggleSignUpButton.setTitle("Switch to signup", forState: UIControlState.Normal)
            signUpState = false
            
            riderLabel.alpha = 0
            driverLabel.alpha = 0
            `switch`.alpha = 0
        } else {
            
            signUpButton.setTitle("Sign Up", forState: UIControlState.Normal)
            toggleSignUpButton.setTitle("Switch to login", forState: UIControlState.Normal)
            signUpState = true
            
            riderLabel.alpha = 1
            driverLabel.alpha = 1
            `switch`.alpha = 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        self.username.delegate = self
        self.password.delegate = self
        
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser()?.username != nil {
            if  PFUser.currentUser()?["isDriver"]! as! Bool == true {
                
                self.performSegueWithIdentifier("loginDriver", sender: self)
                
            } else {
                
                self.performSegueWithIdentifier("loginRider", sender: self)
                
            }
        }
    }
}
