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
        let path = Bundle.main.path(forResource: soundName, ofType:soundType.rawValue)!
        let url = URL(fileURLWithPath: path)
        
        do {
            notePlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
           NSLog("Cannot load \(soundName) file")
        }
    }
    
    func play(){
        notePlayer?.play()
    }
}
