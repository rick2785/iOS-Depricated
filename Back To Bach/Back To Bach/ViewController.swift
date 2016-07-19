//
//  ViewController.swift
//  Back To Bach
//
//  Created by Rickey Hrabowskie on 6/10/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBAction func play(sender: AnyObject) {
        player.play()
        
    }
    @IBOutlet weak var volumeSlider: UISlider!
    @IBAction func adjustVolume(sender: AnyObject) {
        player.volume = volumeSlider.value
        
    }
    
    @IBOutlet weak var scrubSlider: UISlider!
    @IBAction func scrub(sender: AnyObject) {
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stop(sender: AnyObject) {
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
            
        } catch {
            // It didn't work
        }
    }
    
    func updateScrubSlider() {
        scrubSlider.value = Float(player.currentTime)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            
        try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            // It didn't work
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

