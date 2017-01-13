//
//  ViewController.swift
//  BTFlashMessageDemo
//
//  Created by Cong Can NGO on 1/13/17.
//  Copyright © 2017 vns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BTFlashMessage.hide(fromView: self.view, animated: false)
        
        let _ = BTFlashMessage.showAdd(toView: self.view, type: .success, message: "This alert box indicates a successful or positive action.", margin: .zero, animated: true, dismissAfter: 15)
        
        let _ = BTFlashMessage.showAdd(toView: self.view, type: .info, message: "This alert box indicates a neutral informative change or action.", margin: UIEdgeInsetsMake(80, 0, 0, 0), animated: true, dismissAfter: 15)
        

        let _ = BTFlashMessage.showAdd(toView: self.view, type: .warning, message: "This alert box indicates a warning that might need attention.", margin: UIEdgeInsetsMake(180, 20, 0, 20), animated: true, dismissAfter: nil)
        

        let _ = BTFlashMessage.showAdd(toView: self.view, type: .danger, message: "This alert box indicates a dangerous or potentially negative action. ", margin: UIEdgeInsetsMake(280, 40, 0, 40), animated: true, dismissAfter: nil)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

