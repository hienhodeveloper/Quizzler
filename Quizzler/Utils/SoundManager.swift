//
//  SoundManager.swift
//  Quizzler
//
//  Created by mini03 on 9/21/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import Foundation
import AVFoundation

enum SoundType: String{
    case WAV = "wav"
    case MP3 = "mp3"
}

class SoundManager{
    var notePlayer: AVAudioPlayer?
    var soundName: String
    var soundType: SoundType
    
    init(soundName: String,soundType:SoundType = .WAV) {
        self.soundName = soundName
        self.soundType = soundType
    }
    func initSound() {
        let noteUrl = Bundle.main.path(forResource: soundName, ofType: soundType.rawValue)
        do {
            try notePlayer = AVAudioPlayer(contentsOf:URL(fileURLWithPath: noteUrl!) )
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.mixWithOthers])
        } catch  {
            
        }
    }
    
    func play(){
        notePlayer?.prepareToPlay()
        notePlayer?.play()
    }
}
