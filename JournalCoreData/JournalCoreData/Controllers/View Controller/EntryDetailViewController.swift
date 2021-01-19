//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by River McCaine on 1/18/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    
    
    // MARK: - Properties
    // Landing Pad
    var entry: Entry?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.entryTitleTextField.layer.borderWidth = 1
        self.entryTitleTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.entryBodyTextView.layer.borderWidth = 1
        self.entryBodyTextView.layer.borderColor = UIColor.lightGray.cgColor
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func clearButtonTapped(_ sender: Any) {
        entryTitleTextField.text = ""
        entryBodyTextView.text = ""
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = entryTitleTextField.text, !title.isEmpty,
              let body = entryBodyTextView.text, !body.isEmpty else { return }
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, body: body)
        } else {
            EntryController.shared.createEntry(title: title, body: body, timeStamp: Date())
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - Helper Functions
    func updateViews() {
        guard let sentEntry = entry else { return }
        entryTitleTextField.text = sentEntry.title
        entryBodyTextView.text = sentEntry.body
    }
    
    
}
