//
//  EntryController.swift
//  JournalCoreData
//
//  Created by River McCaine on 1/18/21.
//

import CoreData

class EntryController {
    
    // MARK: - Shared Instance
    static let shared =  EntryController()
    
    // MARK: - Source of Truth
    var entries: [Entry] = []
    
    // MARK: - Fetch Request
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // MARK: - CRUD
    // Create
    func createEntry(title: String, body: String, timeStamp: Date = Date()) {
        let newEntry = Entry(title: title, body: body, timeStamp: timeStamp)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        self.entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    func updateEntry(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = body
        CoreDataStack.saveContext()
    }

    func deleteEntry(entry: Entry) {
        if let index = entries.firstIndex(of: entry) {
            entries.remove(at: index)
            CoreDataStack.container.viewContext.delete(entry)
        }
        CoreDataStack.saveContext()
    }
    
    
    
}
