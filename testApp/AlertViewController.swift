//
//  AlertViewController.swift
//  testApp
//
//  Created by Brown Loaner on 2/6/16.
//  Copyright (c) 2016 Provi. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    @IBOutlet weak var alertButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("view loaded")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func receivedClick(sender:UIButton!){
        print("hi the emergency button was clicked!!!")
        
    }

}
