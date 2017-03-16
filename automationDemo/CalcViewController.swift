//
//  ViewController.swift
//  automationDemo
//
//  Created by Bharathram C on 13/04/16.
//  Free to modified and distributed
//

import UIKit

class CalcViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var field1: UITextField?
    @IBOutlet weak var field2: UITextField?
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var opLabel: UILabel!
    
    var field1Value : Double = 0
    var field2Value : Double = 0
    var resultValue : Double = 0
    
    @IBAction func value1EditBegan(_ sender: AnyObject)
    {
        field1!.text = ""
    }
    
    @IBAction func value2EditBegan(_ sender: AnyObject)
    {
        field2!.text = ""
    }
    
    @IBAction func addBtnTapped(_ sender: AnyObject)
    {
        getInputs()
        opLabel.text = "+"

        resultValue = field1Value + field2Value
        result.text = String(resultValue)
    }
    @IBAction func subBtnTapped(_ sender: AnyObject)
    {
        getInputs()
        opLabel.text = "-"
        resultValue = field1Value - field2Value
        result.text = String(resultValue)
        
    }
    
    @IBAction func prodBtnTapped(_ sender: AnyObject)
    {
        getInputs()
        opLabel.text = "*"
        resultValue = field1Value * field2Value
        result.text = String(resultValue)
    }
    
    @IBAction func divBtnTapped(_ sender: AnyObject)
    {
        getInputs()
        opLabel.text = "/"
        resultValue = field1Value / field2Value
        result.text = String(resultValue)
    }
    
    @IBAction func modBtnTapped(_ sender: AnyObject)
    {
        getInputs()
        opLabel.text = "%"
        resultValue = field1Value.truncatingRemainder(dividingBy: field2Value)
        result.text = String(resultValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initAllElements()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CalcViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let swipeLeft : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalcViewController.changeColor2W))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalcViewController.changeColor2P))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
        
        
        
        self.field1!.delegate = self;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initAllElements()
    {
        field1!.text = "0"
        field1!.keyboardType = UIKeyboardType.numbersAndPunctuation
        field2!.text = "0"
        field2!.keyboardType = UIKeyboardType.numbersAndPunctuation
        opLabel.text = ""
        result.text = "0"
        result.isEnabled = false
    }
    
    func getInputs()
    {
        if let _ : Double = Double(field1!.text!)
        {
            field1Value = Double(field1!.text!)!
        }
        else
        {
            field1!.text = "0"
            field1!.becomeFirstResponder()
            displayInvalidNumberAlert()

        }
        
        if let _ : Double = Double(field2!.text!)
        {
            field2Value = Double(field2!.text!)!
        }
        else
        {
            field2!.text = "0"
            field2!.becomeFirstResponder()
            displayInvalidNumberAlert()
        }
    }
    
    func displayInvalidNumberAlert()
    {
        let alertController = UIAlertController(title: "Invalid Input",
            message: "Only Numbers and decimals points Allowed ",
            preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss",
            style: UIAlertActionStyle.default,
            handler: nil))
        
        self.present(alertController,
            animated: true,
            completion: nil)
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func changeColor2W()
    {
        view.backgroundColor = UIColor.white
    }
    
    func changeColor2P()
    {
        view.backgroundColor = UIColor.gray
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        let fieldLbl = textField.accessibilityLabel
        print("The label of current field \(fieldLbl)")
       
        if fieldLbl == "Value1TextField"
        {
            field2!.becomeFirstResponder()
        }
        else
        {
            self.view.endEditing(true)
        }
        
        return false
    }

}

