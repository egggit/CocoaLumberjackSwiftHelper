//
//  LogFormatter.swift
//
//  Created by Egg on 4/15/16.
//  Copyright © 2016 Egg. All rights reserved.
//

import Foundation
import CocoaLumberjack

public func setupDDlogs() {
    
    let ttyLogger = DDTTYLogger.sharedInstance()
    
    ttyLogger.colorsEnabled = true
    ttyLogger.setForegroundColor(UIColor.yellowColor(), backgroundColor: nil, forFlag: .Info)
    ttyLogger.setForegroundColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), backgroundColor: nil, forFlag: .Debug)
    ttyLogger.setForegroundColor(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0), backgroundColor: nil, forFlag: .Verbose)
    ttyLogger.logFormatter = LogFormatter()
    
    #if DEBUG
        let logLevel: DDLogLevel = .Warning
    #else
        let logLevel: DDLogLevel = .Verbose
    #endif
    
    DDLog.addLogger(ttyLogger, withLevel: logLevel) // TTY = Xcode console
    DDLog.addLogger(DDASLLogger.sharedInstance(), withLevel: logLevel) // ASL = Apple System Logs
    
    let fileLogger: DDFileLogger = DDFileLogger() // File Logger
    fileLogger.rollingFrequency = 60*60*24  // 24 hours
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7
    DDLog.addLogger(fileLogger, withLevel: logLevel)
    
    DDLogVerbose("Verbose")
    DDLogDebug("Debug")
    DDLogInfo("Info")
    DDLogInfo(LogConst.Batman)
    DDLogInfo(LogConst.BatmanS)
    DDLogWarn("Warn")
    DDLogError("Error")
}

