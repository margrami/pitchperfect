//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Andres Restrepo Specht on 08/11/15.
//  Copyright © 2015 margrami. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        //Hide stop button
        stopButton.hidden = true
        recordButton.enabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func kiki(sender: UIButton) {
        stopButton.hidden = false
        recordingInProgress.hidden = false
        recordButton.enabled = false
        
        // TODO: Record user voice
        print("kiki: Recording...")
        
    }
    @IBAction func recordAudio(sender: UIButton) {
            stopButton.hidden = false
            recordingInProgress.hidden = false
            recordButton.enabled = false
        
        
        // TODO: Record user voice
            print("Recording...")
    }
    
    
    
    @IBAction func stopRecordAudio(sender: UIButton) {
        
        recordingInProgress.hidden = true
        recordButton.enabled = true
        stopButton.hidden = true
        print("stop Recording")
    }
   

    
    
    
}

