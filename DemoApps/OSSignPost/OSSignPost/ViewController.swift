//
//  ViewController.swift
//  OSSignPost
//
//  Created by Todd Lahtinen on 2/11/19.
//  Copyright © 2019 Todd Lahtinen. All rights reserved.
//

import UIKit
import os

class ViewController: UIViewController {
    static let log = OSLog(subsystem: "MyViewController", category: OSLog.Category.pointsOfInterest)
    let signpostID = OSSignpostID(log: log)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func pressedWork(_ sender: Any) {
         // NOTE #function is a preprecossor language feature that gives us access to program meta data
        os_signpost(OSSignpostType.begin,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)

        work() // NOTE: Using swift's function default value language feature

        os_signpost(OSSignpostType.end,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)
    }

    @IBAction func pressedLotsOfWork(_ sender: Any) {
        os_signpost(OSSignpostType.begin,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)

        for _ in 0 ... 10 {
            work(Int.random(in: 1 ... 100))
        }

        os_signpost(OSSignpostType.end,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)
    }

    func work(_ time: Int = 1) {// NOTE: Using swift's function default value language feature
        os_signpost(OSSignpostType.begin,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)
        if time == 1 {
            fastWork()
        } else if time % 2 == 0 {
            normalWork(Double.init(time))
        } else {
            edgeCaseWork(Double.init(time))
        }

        os_signpost(OSSignpostType.end,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)

    }

    func fastWork() {
        os_signpost(OSSignpostType.begin,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)

        let interval: Double = 1.0 / 1000.0
        Thread.sleep(forTimeInterval: interval)

        os_signpost(OSSignpostType.end,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)
    }

    func normalWork(_ time: Double) {
        os_signpost(OSSignpostType.begin,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)

        let interval: Double = time / 1000.0
        Thread.sleep(forTimeInterval: interval)

        os_signpost(OSSignpostType.end,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)
    }

    func edgeCaseWork(_ time: Double) {
        os_signpost(OSSignpostType.begin,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)

        let interval: Double = time / 1000.0
        Thread.sleep(forTimeInterval: interval)

        os_signpost(OSSignpostType.end,
                    log: ViewController.log,
                    name: #function,
                    signpostID: signpostID)

    }
}

