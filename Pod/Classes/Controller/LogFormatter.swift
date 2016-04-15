//
//  LogFormatter.swift
//
//  Created by Egg on 4/15/16.
//  Copyright © 2016 Egg. All rights reserved.
//

import Foundation
import CocoaLumberjack.DDDispatchQueueLogFormatter

class LogFormatter: DDDispatchQueueLogFormatter {
    let dateFormatter: NSDateFormatter
    
    override init() {
        dateFormatter = NSDateFormatter()
        dateFormatter.formatterBehavior = .Behavior10_4
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        
        super.init()
    }
    
    override func formatLogMessage(logMessage: DDLogMessage!) -> String {
        let dateAndTime = dateFormatter.stringFromDate(logMessage.timestamp)
        return "\(dateAndTime) [\(logMessage.fileName):\(logMessage.line):\(logMessage.function)]: \(logMessage.message)"
    }
}
