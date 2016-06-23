//
//  APIController.swift
//  TopTracksApp
//
//  Created by don't touch me on 6/20/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class APIController: NSObject {
    
    let session = NSURLSession.sharedSession()
    
    
    func fetchArtists(query: String) {
        
        let urlString = "https://api.spotify.com/v1/search?q=\(query)&type=artist"
        
        if let url = NSURL(string: urlString) {
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                if let jsonDictionary = self.parseJSON(data) {
                   
                    if let artistsDict = jsonDictionary["artists"] as? JSONDictionary {
                        
                        if let itemsArray = artistsDict ["items"] as? JSONArray {
                           
                            for itemDict in itemsArray {
                                
                                let theArtist = Artist(dict: itemDict)
                                
                                print(theArtist.name)
                                print(theArtist.artistID)
                                
                                DataStore.sharedInstance.addArtist(theArtist)
                                
                                
                            }
                        }
                    }
                    
                
                } else {
                    print("i could not parse the jsonDictionary")
                }
            })
            task.resume()
            
        }
    }
    
    func fetchTracks(artistID: String) {
        
        let urlString = "https://api.spotify.com/v1/artists/\(artistID)/top-tracks?country=US"
        
        if let url = NSURL(string: urlString) {
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let jsonDictionary = self.parseJSON(data) {
                        
                        if let tracksArray = jsonDictionary["tracks"] as? JSONArray {
                            
                            for tracksDict in tracksArray {
                                
                                let theTrack = Track(dict: tracksDict)
                                
                                print(theTrack.name)
                                print(theTrack.previewURL)
                                
                                DataStore.sharedInstance.addTrack(theTrack)
                                
                                
                            }
                        }
                
                    
                    
                } else {
                    print("i could not parse the jsonDictionary")
                }
            
            })
            task.resume()
            
        }

        
    }
    
    func fetchAlbums(artistID: String) {
        
        let urlString = "https://api.spotify.com/v1/artists/\(artistID)/albums"
        
        if let url = NSURL(string: urlString) {
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let jsonDictionary = self.parseJSON(data) {
                
                        if let albumsArray = jsonDictionary["items"] as? JSONArray {
                        
                            for albumsDict in albumsArray {
                                
                                let theAlbum = Album(dict: albumsDict)
                                
                                print(theAlbum.name)
                                print(theAlbum.albumID)
                                
                                DataStore.sharedInstance.addAlbum(theAlbum)
                            
                            }
                       }
                    
                    
                    
                } else {
                    print("i could not parse the jsonDictionary")
                }
                
            })
            task.resume()
            
        }

                                
                                
      
    }
    
    func fetchRelatedArtists(artistID: String) {
        
        let urlString = "https://api.spotify.com/v1/artists/\(artistID)/related-artists"
        
        if let url = NSURL(string: urlString) {
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
        
                if let JSONDictionary = self.parseJSON(data) {
                    
                    if let relatedArtistsArray = JSONDictionary["artists"] as? JSONArray {
                        
                        for raDict in relatedArtistsArray {
                            
                            let relatedArtist = Artist(dict: raDict)
                            
                            print(relatedArtist.name)
//                            print(relatedArtist.raID)
                            
                            DataStore.sharedInstance.addRelatedArtists(relatedArtist)
                            
                        }
                    }
                    
                    
                    
                } else {
                    print("i could not parse the jsonDictionary")
                }
                
            })
            task.resume()
            
        }

        
    
    }

    func parseJSON(data: NSData?) -> JSONDictionary? {
        
        var theDictionary : JSONDictionary? = nil
        
        if let data = data {
            do {
                
                if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                    
                    
                    theDictionary = jsonDictionary
                    
                    //print(jsonDictionary)
                    
                    
                    
                } else {
                    print("Could not parse jsonDictionary")
                }
                
            } catch {
                
            }
            
            
        } else {
            print("Could not unwrap data")
        }
        
        return theDictionary
}
    
}
