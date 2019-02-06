//
//  DetailsVC.swift
//  songAPI
//
//  Created by Admin on 2/6/19.
//  Copyright © 2019 igc.tn. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
 
    @IBOutlet weak var songTitle: UITextField!
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var album: UITextField!
    @IBOutlet weak var writer: UITextField!
    @IBOutlet weak var rating: UITextField!
    @IBOutlet weak var releaseDate: UITextField!
    @IBOutlet weak var songId: UITextField!
    @IBOutlet weak var composer: UITextField!
    
    var song: Song = Song()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTitle.text = song.title
        artist.text = song.artist
        album.text = song.album
        writer.text = song.writer
        rating.text = song.rating
        releaseDate.text = song.releaseDate
        songId.text = String(song.id)
        composer.text = song.composer

    }
    

    @IBAction func addBtnPressed(_ sender: Any) {
        
      //  let songs = storyboard?.instantiateViewController(withIdentifier: "songs")
        navigationController?.popToRootViewController(animated: true)
       // navigationController?.pushViewController(songs!, animated: true)
    }
}
