//
//  Artist.swift
//  TopTracksApp
//
//  Created by don't touch me on 6/20/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class Artist: NSObject {
    
    var name: String = ""
    var artistID: String = ""
    
    override init() {
        super.init()
            
        self.name = ""
        self.artistID = ""
    }

    init(dict: JSONDictionary) {
      
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("i could not parse the name")
        }
        
        if let artistID = dict["id"] as? String {
            self.artistID = artistID
        } else {
            print("i could not parse the name")
        }

    }
    
}
