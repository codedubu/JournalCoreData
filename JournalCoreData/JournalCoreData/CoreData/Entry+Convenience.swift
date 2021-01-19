//
//  Journal+Convenience.swift
//  JournalCoreData
//
//  Created by River McCaine on 1/18/21.
//

import CoreData

extension Entry {
    
    @discardableResult convenience init(title: String, body: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
    }
    
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body && lhs.timeStamp == rhs.timeStamp
    }
    
} // End of extension


