//
//  playViewController.swift
//  musicPlayer
//
//  Created by Rajkumar on 15/09/18.
//  Copyright © 2018 Rajkumar. All rights reserved.
//

import UIKit
import AVFoundation

class playViewController: UIViewController {
    
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var selectedSong : dataStore?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = 2 * Double.pi
        rotation.duration = 2
        rotation.repeatCount = Float.infinity
        img.layer.add(rotation, forKey: "Spin")
        
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
        if let ass1 = selectedSong?.artistName{
            first.text = ass1
          //  first.sizeToFit()
        }
        if let ass2 = selectedSong?.trackName{
            subTitle.text = ass2
        }
        if let ass3 = selectedSong?.artworkUrl100{
            
            let url = URL(string: ass3)
            
            DispatchQueue.global().async {
                 let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    self.img.image = UIImage(data: data!)
                }
            }
            
        }
        if let ass4 = selectedSong?.trackPrice{
            var s:String = "$ "
            s.append(String(ass4))
            second.text = s
        }
        if let ass5 = selectedSong?.releaseDate{
            third.text = ass5
        }
        if let ass6 = selectedSong?.previewUrl{
            let url = URL(string: ass6)
            let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
            player = AVPlayer(playerItem: playerItem)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func play(_ sender: Any) {
        //player?.play()
        playButtonTapped(playButton)
    }
    
    @objc func playButtonTapped(_ sender:UIButton)
    {
        if player?.rate == 0
        {
            player!.play()
            //playButton!.setImage(UIImage(named: "player_control_pause_50px.png"), forState: UIControlState.Normal)
            playButton!.setBackgroundImage(UIImage(named: "stop.png"), for: UIControlState.normal)
        } else {
            player!.pause()
            //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
            playButton!.setBackgroundImage(UIImage(named: "play.png"), for: UIControlState.normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        
//        if (UIDevice.current.orientation.isLandscape) {
//            // ------ Landscape -----
//            // Setup constraints
//            playButton.frame = CGRect(x: 0, y: 135, width: playButton.frame.size.width, height: 50)
//            
//        } else {
//            // ----- Portrait -----
//            // Setup constraints
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
