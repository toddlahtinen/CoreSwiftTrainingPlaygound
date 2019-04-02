//
//  ViewController.swift
//  OSLog
//
//  Created by Todd Lahtinen on 4/2/19.
//  Copyright © 2019 Todd Lahtinen. All rights reserved.
//

import UIKit
import os

class ViewController: UIViewController {
    public static let log = OSLog(subsystem: "com.someorg.custom.viewcontroller", category: "ViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "ViewController"
        startLoggingStuff()
    }

    func startLoggingStuff() {
        os_log(OSLogType.debug, log: ViewController.log, "%@: %@", self.title!, Date().description)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.utility).asyncAfter(deadline: .now() + 1.0 , execute: {
            self.startLoggingStuff()
        })
    }
}

