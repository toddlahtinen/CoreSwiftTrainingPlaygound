//
//  LoggingButtonViewController.swift
//  OSLog
//
//  Created by Todd Lahtinen on 4/2/19.
//  Copyright © 2019 Todd Lahtinen. All rights reserved.
//

import UIKit
import os

class LoggingButtonViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    public static let log = OSLog(subsystem: "com.someorg.custom.button", category: "ViewController")
    var level = OSLogType.debug
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        startLoggingStuff()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        switch level {
        case OSLogType.debug:
            level = .default
        case OSLogType.default:
            level = .error
        case OSLogType.error:
            level = .fault
        case OSLogType.fault:
            level = .info
        case OSLogType.info:
            level = .debug
        default:
            break
        }
        UIView.animate(withDuration: TimeInterval.init(exactly: 1/3)!) {
            self.updateUI()
        }
        os_log(OSLogType.debug, log: LoggingButtonViewController.log, "%@", Thread.callStackSymbols.joined(separator: "\n"))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func updateUI() {
        switch level {
        case OSLogType.debug:
            button.backgroundColor = UIColor.gray
            button.titleLabel?.textColor = UIColor.lightText
            button.setTitle("debug", for: UIControl.State.normal)
            break
        case OSLogType.default:
            button.backgroundColor = UIColor.lightGray
            button.titleLabel?.textColor = UIColor.lightText
            button.setTitle("default", for: UIControl.State.normal)
            break
        case OSLogType.error:
            button.backgroundColor = UIColor.darkGray
            button.titleLabel?.textColor = UIColor.lightText
            button.setTitle("error", for: UIControl.State.normal)
            break
        case OSLogType.fault:
            button.backgroundColor = UIColor.black
            button.titleLabel?.textColor = UIColor.lightText
            button.setTitle("fault", for: UIControl.State.normal)
            break
        case OSLogType.info:
            button.backgroundColor = UIColor.green
            button.titleLabel?.textColor = UIColor.lightText
            button.setTitle("info", for: UIControl.State.normal)
            break
        default:
            break
        }
    }

    func startLoggingStuff() {
        DispatchQueue.main.async {
            let title = self.button.currentTitle!
            let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.utility)
            queue.async {
                os_log(self.level, log: LoggingButtonViewController.log, "%@: %@", title, Date().description)
                queue.asyncAfter(deadline: .now() + 1.0 , execute: {
                    self.startLoggingStuff()
                })
            }
        }

    }
}
