//
//  AlertViewController.swift
//  testApp
//
//  Created by Brown Loaner on 2/6/16.
//  Copyright (c) 2016 Provi. All rights reserved.
//

import UIKit
import CoreBluetooth



class AlertViewController: UIViewController {
    @IBOutlet weak var alertButton: UIButton!
    let ACCOUNT_SID = "ACd7dc6d2d7b9518561275656fc46787e5"
    let AUTH_TOKEN = "1ecb75e8fca8e5f65fa790c4e40602ff"
    let TWILIO_NUM = "+19135433698"
    let TO_NUMBER = "+14016123230"
    let message = "Sam sent you an emergency alert."
    

    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Do any additional setup after loading the view, typically from a nib.
    
        
        // Scan for all available CoreBluetooth LE devices
        
//        let uid = init(1802);
//        NSArray *services = [NSArray arrayWithObject:[CBUUID UUIDWithString:@"1802"]];
//        CBCentralManager *centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
//        
//        //scan for devices
//        [centralManager scanForPeripheralsWithServices:services options:nil];
//        self.centralManager = centralManager;
        
        
        
//        let status = ABAddressBookGetAuthorizationStatus()
//        if status == .Denied || status == .Restricted {
//            // user previously denied, to tell them to fix that in settings
//            return
//        }
//        
//        // open it
//        
//        var error: Unmanaged<CFError>?
//        let addressBook: ABAddressBook? = ABAddressBookCreateWithOptions(nil, &error)?.takeRetainedValue()
//        if addressBook == nil {
//            print(error?.takeRetainedValue())
//            return
//        }
//        
//        // request permission to use it
//        
//        ABAddressBookRequestAccessWithCompletion(addressBook) {
//            granted, error in
//            
//            if !granted {
//                // warn the user that because they just denied permission, this functionality won't work
//                // also let them know that they have to fix this in settings
//                return
//            }
//            
//            if let people = ABAddressBookCopyArrayOfAllPeople(addressBook)?.takeRetainedValue() as? NSArray {
//                // now do something with the array of people
//                print(people)
//            }
//        }
        
        let centralManager:CBCentralManager!
        var connectingPeripheral:CBPeripheral!
        
        let serviceUUIDs:[AnyObject] = [CBUUID(string: "1802")];
        
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
        let request = NSMutableURLRequest(URL: NSURL(string:"https://\(ACCOUNT_SID):\(AUTH_TOKEN)@api.twilio.com/2010-04-01/Accounts/\(ACCOUNT_SID)/SMS/Messages")!) //auth
        request.HTTPMethod = "POST"
        request.HTTPBody = "From=\(TWILIO_NUM)&To=\(TO_NUMBER)&Body=\(message)".dataUsingEncoding(NSUTF8StringEncoding) //parameters
        
        // Build the completion block and send the request
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            print("Finished")
            if let data = data, responseDetails = NSString(data: data, encoding: NSUTF8StringEncoding) {
                // Success
                print("Response: \(responseDetails)")
            } else {
                // Failure
                print("Error: \(error)")
            }
        }).resume()
        
        print("hello it's me")
    }

}
