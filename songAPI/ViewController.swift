//
//  ViewController.swift
//  songAPI
//
//  Created by Admin on 1/29/19.
//  Copyright © 2019 igc.tn. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet weak var songsTable: UITableView!
    
    let url: String = "https://songsapisolution.azurewebsites.net/api/Song"
    var songArray = [AnyObject]()
    var data = [Song]()
    
     override func viewDidLoad() {
        super.viewDidLoad()
         songsTable.dataSource = self
        songsTable.delegate = self
        
        
        Alamofire.request(url).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                //
                if let resData = swiftyJsonVar[].arrayObject {
                    self.songArray = resData as [AnyObject]
                   
                }
                if self.songArray.count > 0 {
                    self.songsTable.reloadData()
                     print(self.songArray)
                }
            }
        }
       // name()
    }
    
    func name ()
    {
     for sonng in songArray{
      var s: Song = Song(id: sonng["id"] as! Int , title: sonng["title"] as! String , releaseDate: sonng["releaseDate"] as! Date , artiste: sonng["artist"] as! String, album: sonng["album"] as! String, composer: sonng["composer"] as! String, writer: sonng["writer"] as! String, rating: sonng["rating"] as! String)
        data.append(s)
    }
        print("my data \(data)")
    }
    
    @IBAction func newSongBtnClicked(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        let title = songArray[indexPath.row]
         cell.songTitle.text = title["title"] as? String
         cell.artistName.text = title["artist"] as? String
  
     //   let s: Song = Song(id: title["id"] as! Int , title: title["title"] as! String , releaseDate: title["releaseDate"] as! Date , artiste: title["artist"] as! String, album: title["album"] as! String, composer: title["composer"] as! String, writer: title["writer"] as! String, rating: title["rating"] as! String)
        //print ("a row of data \(s)")
        // print ( makeGetCallWithAlamofire(id: indexPath.row+1))
        return cell
    }
    
 }
    

    
    


    
   


