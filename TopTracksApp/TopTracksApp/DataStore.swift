//
//  DataStore.swift
//  TopTracksApp
//
//  Created by don't touch me on 6/20/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

//DataStore will hold all of our artist and arrays for the app

class DataStore: NSObject {
    
//    singleton
    static let sharedInstance = DataStore()
    override private init() {}
    
    var artistsArray = [Artist]()
    var tracksArray = [Track]()
    var albumsArray = [Album]()
    var relatedArtistsArray = [Artist]()
    
    
    func addArtist(theArtist: Artist) {
        self.artistsArray.append(theArtist)
    }
    
    func addTrack(theTrack: Track) {
        self.tracksArray.append(theTrack)
    
    }
    
    func addAlbum(theAlbum: Album) {
        self.albumsArray.append(theAlbum)
    }

    func addRelatedArtists(relatedArtist: Artist) {
        self.relatedArtistsArray.append(relatedArtist)

    }
}