//
//  Song.swift
//  songAPI
//
//  Created by Admin on 2/1/19.
//  Copyright © 2019 igc.tn. All rights reserved.
//

import Foundation

class Song {
    
    var id: Int
    var title: String
    var releaseDate: String
    var artist: String
    var album: String
    var composer: String
    var writer: String
    var rating: String
    
    init ()
    {
        self.id = 100
        self.title = ""
        self.releaseDate = ""
        self.artist = ""
        self.album = ""
        self.composer = ""
        self.writer = ""
        self.rating = ""
    }
    init(id: Int, title: String, releaseDate: String, artiste: String, album: String ,composer: String , writer: String, rating: String) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.artist = artiste
        self.album = album
        self.composer = composer
        self.writer = writer
        self.rating = rating
        
    }
    
}
