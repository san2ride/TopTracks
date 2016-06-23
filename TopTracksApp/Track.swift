//
//  Track.swift
//  TopTracksApp
//
//  Created by don't touch me on 6/20/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class Track: NSObject {

    var name: String = ""
    var previewURL: String = ""
    
    override init() {
        super.init()
        
        self.name = ""
        self.previewURL = ""
    }
    
    init(dict: JSONDictionary) {
        
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("i could not parse the name")
        }
        
        if let previewURL = dict["previewURL"] as? String {
            self.previewURL = previewURL
        } else {
            print("i could not parse the previewURL")
        }
    }
    
}
