//
//  Album.swift
//  TopTracksApp
//
//  Created by don't touch me on 6/20/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class Album: NSObject {

    var name: String = ""
    var albumID: String = ""
    
    override init() {
        super.init()

        self.name = ""
        self.albumID = ""
    }
    
    init(dict: JSONDictionary) {
        
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("i could not parse the name")
        }
        
        if let albumID = dict["id"] as? String {
            self.albumID = albumID
        } else {
            print("i could not parse the albumID")
        }
        
    }
        
}
