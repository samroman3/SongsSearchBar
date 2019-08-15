//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    let songs = Song.loveSongs
    
//    var songSearchResults: [Song] {
//        get {
//            guard let searchString = searchString else {
//                return songs
//            }
//            guard searchString != "" else {
//                return songs
//            }
//            return songs.filter{$0.name.contains(searchString) || $0.artist.contains(searchString)}
//        }
//    }
    var songSearchResults: [Song] {
        get {
            guard let searchString = searchString else {
                return songs
            }
            guard searchString != "" else {
                return songs
            }
            let scopeArrTitles = searchBarOut.scopeButtonTitles
            let currentIndex = searchBarOut.selectedScopeButtonIndex
            let selectedStr = scopeArrTitles![currentIndex]
            switch selectedStr {
            case "Song":
                return songs.filter{$0.name.contains(searchString)}
            case "Artist":
                return songs.filter{$0.artist.contains(searchString)}
            default:
                return songs
            }
        }
    }

    
    var searchString: String? = nil {
        didSet {
            self.tableViewOut.reloadData()
        }
    }
    
    @IBOutlet weak var tableViewOut: UITableView!
    @IBOutlet weak var searchBarOut: UISearchBar!
    
    
    //MARK: - TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        cell.textLabel!.text = songSearchResults[indexPath.row].name
        cell.detailTextLabel!.text = songSearchResults[indexPath.row].artist
        
        return cell
    }
    
    //MARK: -Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            fatalError("No identifier in segue")
        }
        switch segueIdentifier {
        case "detailSegue":
            guard let detailVC = segue.destination as? DetailViewController
                else {
                fatalError("Unexpected segue")}
            guard let selectedIndexPath = tableViewOut.indexPathForSelectedRow else {
                fatalError("No row selected")
            }
           detailVC.detailSongs = songSearchResults[selectedIndexPath.row]
        default:
            fatalError("Unexpected segue identifier")
        }
    }
    

    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        tableViewOut.delegate = self
        tableViewOut.dataSource = self
        searchBarOut.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchString = searchBar.text
    }
    
    
}

