//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Andres Restrepo Specht on 11/11/15.
//  Copyright © 2015 margrami. All rights reserved.
//

import UIKit
import AVFoundation



//var audioPlayer : AVAudioPlayer! // var audioPlayer declared here
//let filePath = NSBundle.mainBundle().pathForResource("my_audio", ofType:".wav")!
//let url = NSURL(fileURLWithPath: filePath)




class PlaySoundsViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    
    // Creates AVAudioEngine object
    var audioEngine : AVAudioEngine!
    var audioFile:AVAudioFile!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func slowlySound(sender: UIButton) { // action
        print("slowly:Alive")
        audioPlayer.play()  // audioPlayer is used here
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        
    }

 
    @IBAction func fastSound(sender: UIButton) {
        print("fast:Alive")
        audioPlayer.play()  // audioPlayer is used here
        audioPlayer.rate = 1.6
        audioPlayer.currentTime = 0.0

    }
    
    @IBAction func playChippmunkAudio(sender: UIButton) {
      playAudioWithVariablePitch(1000)
        
    }
    
    
    @IBAction func DarthVaderAudio(sender: UIButton) {
       playAudioWithVariablePitch(-1000)
    }
    
    //New Function
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    
    
    @IBAction func soundStop(sender: UIButton) {
        print("Stop2: alive")
        audioPlayer.stop()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
