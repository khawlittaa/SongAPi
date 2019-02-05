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
    var releaseDate: Date
    var artist: String
    var album: String
    var composer: String
    var writer: String
    var rating: String
    
    init(id: Int, title: String, releaseDate: Date, artiste: String, album: String ,composer: String , writer: String, rating: String) {
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
