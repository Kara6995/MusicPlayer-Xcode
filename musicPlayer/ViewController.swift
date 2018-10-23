//
//  ViewController.swift
//  musicPlayer
//
//  Created by Rajkumar on 08/09/18.
//  Copyright © 2018 Rajkumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var songList: UITableView!
    
    var refreshControl:UIRefreshControl!
    
    var valueToPass = ""
    var titleArr:[String] = []
    var subArr:[String] = []
    var dataArr:[dataStore] = []
    var value:dataStore?
    var searchActive : Bool = false
    var filtered:[String] = []
    var filtered1:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        songList.addSubview(refreshControl)
        refreshControl.attributedTitle = NSAttributedString(string:"refreshing")
        refreshControl.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        
        
        let sharedSession = URLSession.shared

        let url = URL(string: "https://itunes.apple.com/search?term=michael")!
        
        let task = sharedSession.dataTask(with: url) {(data, response, error) in
            
            
            guard let data = data else { return }
         //   print(String(data: data, encoding: .utf8)!)
            
            
            do{
                let json =  try JSONSerialization.jsonObject(with: data as Data, options: []) as!  [String: AnyObject]
               // print(json)
                //STEP 2 - Extracting
                // Getting first name
                if let rootArray = json["results"] as? [[String:AnyObject]] {
                    // access individual value in dictionary
                
                    for i in rootArray{
                        
                        
                        if(i["artistName"] != nil && i["trackName"] != nil && i["artworkUrl100"] != nil && i["releaseDate"] != nil && i["trackPrice"] != nil && i["previewUrl"] != nil) {
                            
                            
                            
                            let dataObj = dataStore(artistName: i["artistName"] as! String, trackName: i["trackName"]as! String, artworkUrl100: i["artworkUrl100"]as! String, releaseDate: i["releaseDate"]as! String, trackPrice: i["trackPrice"] as! Double, previewUrl: i["previewUrl"]as! String)
                            
                                self.dataArr.append(dataObj)
                            
                        }
                        
                        
                        
                        if let firstName = i["artistName"]{
                            self.titleArr.append(firstName as! String)
                          
                        }
                        if let subTitle = i["trackName"]{
                            self.subArr.append(subTitle as! String)
                            
                        }
                    }
                    print(self.dataArr.count)
                }
                
            }catch{
                print(error)
            }
            self.do_table_refresh();
        }
        
        task.resume()        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func refresh(){ //wrapper
        print("reload table view here")
        refreshControl.endRefreshing()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchActive = false;
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchActive = false;
        }
         filtered = titleArr.filter({$0.prefix(searchText.count) == searchText})
        filtered1 = subArr.filter({$0.prefix(searchText.count) == searchText})
        
        filtered.append(contentsOf: filtered1)
        
        self.songList.reloadData()
        
    }
    
    
    func numberOfSectionsInTableView(songList: UITableView) -> Int {
        return 1
    }

    
    
    
    // Async. Queue to make refresh process in thread
    func do_table_refresh(){
        DispatchQueue.main.async {
            self.songList.delegate=self
            self.songList.dataSource=self
            self.songList.reloadData()
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let imge = dataArr[indexPath.row].artworkUrl100
        
        let url = URL(string: imge!)
        
        
        let list = self.titleArr[indexPath.row]
        let sub = self.subArr[indexPath.row]
        
        
        
        
        //Create cell
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicList", for: indexPath)
        
        //Add data
        
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
            
        } else {
        cell.textLabel?.text = list
        cell.detailTextLabel?.text = sub
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: data!)
              //  cell.imageView?.frame = CGRect(x : 0, y : 10,width: 45, height: 45)
              
            }
        }
        }

        //Return cell
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("selected row \(indexPath.row)")
        value = self.dataArr[indexPath.row]
       
        self.performSegue(withIdentifier: "openAudio", sender: self) // Trigger the navigation
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) { //before navigation
        let destinationView = segue.destination as! playViewController
        
        destinationView.selectedSong = value
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
    
}

