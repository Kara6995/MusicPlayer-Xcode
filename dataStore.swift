//
//  dataStore.swift
//  musicPlayer
//
//  Created by Rajkumar on 15/09/18.
//  Copyright © 2018 Rajkumar. All rights reserved.
//

import UIKit

class dataStore: NSObject {
    
    var artistName:String?
    var trackName:String?
    var artworkUrl100:String?
    var releaseDate:String?
    var trackPrice:Double?
    var previewUrl:String?
    
    init(artistName:String, trackName:String, artworkUrl100:String, releaseDate:String, trackPrice:Double, previewUrl:String) {
        
        self.artistName = artistName
        self.trackName = trackName
        self.artworkUrl100 = artworkUrl100
        self.releaseDate = releaseDate
        self.trackPrice = trackPrice
        self.previewUrl = previewUrl
        
        
    }
    
    
    
}
