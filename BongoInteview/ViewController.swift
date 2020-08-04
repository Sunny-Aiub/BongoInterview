//
//  ViewController.swift
//  BongoInteview
//
//  Created by Sunny Chowdhury on 7/30/20.
//  Copyright © 2020 Sunny Chowdhury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var btnGetContents: UIButton!
    
    var outputText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //getContentsFromUrl()
    }

    @IBAction func buttonClicked(_ sender: Any) {
        self.outputText = ""
        let url : String = "https://bongobd.com/disclaimer"
        let dataString = getStringFromUrl(urlString: url)

        _ = getContentsFromUrl(contents: dataString)
        self.contentTextView.text = self.outputText
    }
    
    public func getStringFromUrl(urlString: String) -> String {
        
        var data: String = ""
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
               
                data = contents
            } catch {
                print("The Contents could not be loaded!")
            }
        } else {
            print("The URL was bad!")
        }
        return data
    }
    
    public func getContentsFromUrl(contents: String) -> String{
        
        if contents.count > 0{
            print("Last charachter: \t \(contents.last!)\n")
            let str = "Last charachter: \t \(contents.last!)\n"
            self.outputText.append(str)
            
            let array = contents.map( { String($0) })
             for (index,character) in array.enumerated(){
                 if (index + 1)%10 == 0{
                     print("\(index + 1)th charachter: \t \(character)\n")
                    let str = "\(index + 1)th charachter: \t \(character)\n"
                    self.outputText.append(str)
                 }
             }
        }else{
            print("No Content Found")
        }
        
        return self.outputText
    }

}

 
