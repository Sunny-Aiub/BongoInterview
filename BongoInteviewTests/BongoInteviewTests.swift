//
//  BongoInteviewTests.swift
//  BongoInteviewTests
//
//  Created by Sunny Chowdhury on 7/30/20.
//  Copyright © 2020 Sunny Chowdhury. All rights reserved.
//

import XCTest
@testable import BongoInteview

class BongoInteviewTests: XCTestCase {

    var vc:ViewController?
    var outputText: String = ""
    
    override func setUp() {
        let storyboard=UIStoryboard(name:"Main", bundle:nil)
        vc = storyboard.instantiateViewController(identifier:String(describing:ViewController.self))
        vc!.loadViewIfNeeded()
    }
    
    override func tearDown() {
        vc = nil
    }
    
    func testIfLoginButtonHasActionAssigned() {
        
        //Check if Controller has UIButton property
        let btnGetContents: UIButton = vc?.btnGetContents ?? UIButton()
        XCTAssertNotNil(btnGetContents, "View Controller does not have UIButton property")
        
        // Attempt Access UIButton Actions
        guard let btnGetContentsActions = btnGetContents.actions(forTarget: vc, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
     
        // Assert UIButton has action with a method name
        XCTAssertTrue(btnGetContentsActions.contains("buttonClicked:"))
        
        
        let url : String = "https://bongobd.com/disclaimer"
        let dataString = vc!.getStringFromUrl(urlString: url)
        outputText = vc!.getContentsFromUrl(contents: dataString)

        XCTAssertEqual(outputText, vc?.outputText)

    }
    
    
      

}
