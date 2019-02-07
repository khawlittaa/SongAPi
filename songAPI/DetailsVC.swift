//
//  DetailsVC.swift
//  songAPI
//
//  Created by Admin on 2/6/19.
//  Copyright © 2019 igc.tn. All rights reserved.
//

import UIKit
import Alamofire

class DetailsVC: UIViewController {
   
    let url: String = "https://songsapisolution.azurewebsites.net/api/Song"
    
    var song: Song = Song()
    var newSong: Song = Song()
    
    @IBOutlet weak var songTitle: UITextField!
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var album: UITextField!
    @IBOutlet weak var writer: UITextField!
    @IBOutlet weak var rating: UITextField!
    @IBOutlet weak var releaseDate: UITextField!
    @IBOutlet weak var songId: UITextField!
    @IBOutlet weak var composer: UITextField!
    
    
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

    func makePostCallWithAlamofire(newSong: Song) {
        let song: [String: Any] = ["title": newSong.title,  "releaseDate": newSong.releaseDate, "artist": newSong.artist,"album": newSong.album, "composer": newSong.composer, "writer": newSong.writer, "rating": newSong.rating ]
        
    Alamofire.request(url, method: .post, parameters: song, encoding: JSONEncoding.default)
        .responseJSON { response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                print("error calling POST on /song/1")
                print(response.result.error!)
                return
            }
            // make sure we got some JSON since that's what we expect
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get song object as JSON from API")
                if let error = response.result.error {
                    print("Error: \(error)")
                }
                return
            }
            // get and print the title
            guard let idNumber = json["id"] as? Int else {
                print("Could not get id number from JSON")
                return
            }
            print("Created Song with id: \(idNumber)")
    }
}
    

    @IBAction func addBtnPressed(_ sender: Any) {
        
        newSong.title =  songTitle.text!
        newSong.artist = artist.text!
        newSong.album = album.text!
        newSong.writer = writer.text!
        newSong.rating = rating.text!
        newSong.releaseDate  = releaseDate.text!
        newSong.composer = composer.text!
        
        makePostCallWithAlamofire(newSong: newSong)
      //  let songs = storyboard?.instantiateViewController(withIdentifier: "songs")
        navigationController?.popToRootViewController(animated: true)
       // navigationController?.pushViewController(songs!, animated: true)
        
    }
    
    
}
