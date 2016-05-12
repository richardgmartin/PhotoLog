//
//  PhotosViewController.swift
//  PhotoLog
//
//  Created by Richard Martin on 2016-05-10.
//  Copyright © 2016 richard martin. All rights reserved.
//

import UIKit
import CoreLocation

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var photoObjects = [Photo]()
    var initialPhoto = "my 1st PhotoLog photo"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PhotoLog"
        initializeTableCells()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func initializeTableCells() {
        for i in 0...2 {
            photoObjects[i].imageName = initialPhoto
        }
    }
    
    @IBAction func onAddButtonTapped(sender: UIBarButtonItem) {
        presentPhotoLogEntry()
    }
    
    func presentPhotoLogEntry() {
        // present alertcontroller to enter Photo name (imageName)
        
        let title = "PhotoLog"
        let message = "Enter title of photo"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        ac.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "photo title"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action) in
            let photoTitle = ac.textFields![0]
            print("saved photo title is: \(photoTitle.text)")
            self.photoObjects[0].imageName = photoTitle.text!
        })
        ac.addAction(saveAction)
        
        presentViewController(ac, animated: true, completion: nil)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoObjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)
        
        cell.detailTextLabel!.text = self.photoObjects[0].imageName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // some code here
    }
    
    
}
