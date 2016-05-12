//
//  Photo.swift
//  PhotoLog
//
//  Created by Richard Martin on 2016-05-10.
//  Copyright © 2016 richard martin. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    var imageName: String
    var shootLocation: String
    var dateCreated: NSDate
    
    // designated initializer
    
    init(imageName: String) {
        self.imageName = imageName
        self.shootLocation = "san franciso"
        self.dateCreated = NSDate()
        
        super.init()
    }
    
    
}