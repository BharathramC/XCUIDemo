//
//  FetchModel.swift
//  automationDemo
//
//  Created by Bharathram C on 14/03/17.
//  Copyright © 2017 com.ibm.mobilefirst. All rights reserved.
//

import Foundation

class FetchModel{
    // generates a random input of specified type with 'length' digits and enters it as a whole
    func generateRandomInput(length: Int) -> String
    {
        var possibleInputs : String = ""
        possibleInputs = "0123456789"
        let charsArray : [Character] = Array(possibleInputs.characters)
        
        var string = ""
        for _ in 0..<length {
            string.append(charsArray[Int(arc4random()) % charsArray.count])
        }
        
        return string
    }
}
