//
//  ViewController.swift
//  songAPI
//
//  Created by Admin on 1/29/19.
//  Copyright © 2019 igc.tn. All rights reserved.
//

import UIKit
import Alamofire
//import SwiftyJSON

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet weak var songsTable: UITableView!
    
    let url: String = "https://songsapisolution.azurewebsites.net/api/Song"
    var songArray = [AnyObject]()
    var allSongs: [Song] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songsTable.dataSource = self
        songsTable.delegate = self
        
        getNewsFromInternet { (songs: [Song]?) in
            guard let songs = songs else {
                return
            }
            
            self.allSongs = songs
            self.songsTable.reloadData()
        }
    }
    
    func getNewsFromInternet(onComplition: @escaping ([Song]?)->()){
        request(url, method: .get).responseJSON { (dataResponse: DataResponse<Any>) in
            
            guard let statusCode = dataResponse.response?.statusCode else {
                onComplition(nil)
                return
            }
            
            let result = dataResponse.result.value
            
            switch statusCode {
            case 200:
                guard let allData = result as? [[String: AnyObject]] else {
                    onComplition(nil)
                    return
                }
                
                var allSongs: [Song] = []
                
                for data in allData {
                    if let song = self.parseFromJson(jsonData: data) {
                        allSongs.append(song)
                    }
                }
                
                onComplition(allSongs)
            default:
                onComplition(nil)
                return
            }
            
        }
    }
    

    
    func parseFromJson(jsonData: [String: AnyObject]) -> Song?{
        
        //Required fileds
        print ("parsing my song data ")
        guard let id = jsonData["id"] as? Int, let title = jsonData["title"] as? String, let artist = jsonData["artist"] as? String, let album = jsonData["album"] as? String, let composer = jsonData["composer"] as? String, let writer = jsonData["writer"] as? String, let rating = jsonData["rating"] as? String , let releaseDate = jsonData["releaseDate"] as? String  else {
            return nil
        }
        
        let song = Song(id: id, title: title, releaseDate: releaseDate, artiste: artist, album: album, composer: composer, writer: writer, rating: rating)
        print ("my song \(song)")
        
        return song
        
    }
    
    
    @IBAction func newSongBtnClicked(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        //  let title = songArray[indexPath.row]
        cell.songTitle.text = allSongs[indexPath.row].title
        cell.artistName.text = allSongs[indexPath.row].artist
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsVC
        details.song = allSongs[indexPath.row]
        navigationController?.pushViewController(details, animated: true)

    }
    
}










