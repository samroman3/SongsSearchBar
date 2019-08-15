//
//  DetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Sam Roman on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var detailSongs: Song!
    
    
    
    @IBOutlet weak var imageOut: UIImageView!
    
    @IBOutlet weak var songName: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    
    override func viewDidLoad() {
        imageOut.image = UIImage(named: "loveSongs")
        songName.text = detailSongs.name
        artistName.text = detailSongs.artist
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
