//
//  ArtistViewController.swift
//  TopTracksApp
//
//  Created by don't touch me on 6/20/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let apiController = APIController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.fetchArtists("5I3UdCxtIh6hkQ7rMPUvA4")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ArtistCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Test"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    }
    

    



