//
//  FetchViewController.swift
//  automationDemo
//
//  Created by Bharathram C on 14/03/17.
//  Copyright © 2017 com.ibm.mobilefirst. All rights reserved.
//

import UIKit

class FetchViewController: UIViewController {
    @IBOutlet weak var numberField: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
   
    @IBAction func fetchButton(_ sender: Any) {
       startAndDisableView()
       statusLabel.text = "Fetching Lucky Numbers"
       numberField.text = " "
        
        DispatchQueue.global(qos: .background).async{
            for _ in 0..<6{
                let currentNumber = String(arc4random() % 10)
                self.updateNumberField(input: currentNumber)
                Thread.sleep(forTimeInterval: 0.40)
            }
            
            self.updateStatusField(input: "Fetch Complete")
            self.stopAndEnableView()
        }
        
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        startAndDisableView()
        let someRandomDelay = arc4random() % 5 + 2
        DispatchQueue.global(qos: .background).async {
            sleep(0)
            self.stopAndEnableView()
            
        }

        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stopAndEnableView(){
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
            self.activityIndicator.isHidden = true
            self.view.alpha = 1
            self.statusLabel.text = "View is Now Active"
        }
        
        }
    
    func startAndDisableView(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
        self.view.isUserInteractionEnabled = false
        self.activityIndicator.color = UIColor.red
        self.activityIndicator.startAnimating()
        self.view.alpha = 0.5
        }
    }
    
    func updateNumberField(input: String){
        DispatchQueue.main.async {
            self.numberField.text = self.numberField.text! + input + " "
        }
    }
    
    func updateStatusField(input: String){
        DispatchQueue.main.async {
            self.statusLabel.text = input
        }
    }



}
