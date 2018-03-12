//
//  ViewController.swift
//  testAPP
//
//  Created by Spy on 12.03.18.
//  Copyright © 2018 Spy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playButton: UIButton!
    let vlcPlayer = Utils.vlcPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.vlcPlayer.libraryInstance.debugLogging = true
        self.vlcPlayer.drawable = playerView
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationWillResignActive),
            name:NSNotification.Name.UIApplicationWillResignActive,
            object: nil)
        
    }
    
    @objc func applicationWillResignActive(notification: NSNotification) {
        //  stop = true
        self.vlcPlayer.stop()
        
        playButton.setImage(UIImage(named:"play"), for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func togglePlayPause(_ sender: UIButton) {
        if(vlcPlayer.isPlaying) {
            self.vlcPlayer.stop()
            playButton.setImage(UIImage(named:"play"), for: .normal)
        } else {
            let media = VLCMedia(url: URL(string: "http://217.19.211.251:42002")!)
            self.vlcPlayer.media = media
            vlcPlayer.play()
            playButton.setImage(UIImage(named:"stop"), for: .normal)
        }
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
