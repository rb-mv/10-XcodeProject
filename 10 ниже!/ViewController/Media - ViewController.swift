//
//  Media - ViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 28.07.2024.
//

import UIKit
import AVFAudio

extension ViewController {
    
    
    func checkSoundExist(_ player: inout AVAudioPlayer, _ mediaArray: [String]) {
        for sound in mediaArray {
            
            // Попробуем получить аудиофайл из ассетов
            if let dataAsset = NSDataAsset(name: sound) {
                do {
                    player = try AVAudioPlayer(data: dataAsset.data)
                } catch {
                    print("Something went wrong with using func 'checkSoundExist' with sound \(sound)")
                }
            } else {
                print("I cannot find the audio asset \(sound)")
            }
        }
    }
    
    func playCurrentClickSound(player: inout AVAudioPlayer, state: Bool) {
        
        var sound = String()
        
        switch state {
        case true: sound = buttonClickSounds[1]
        case false: sound = buttonClickSounds[0]
            
        }
        
        if let dataAsset = NSDataAsset(name: sound) {
            do {
                player = try AVAudioPlayer(data: dataAsset.data)
                player.play()
            } catch {
                print("Something went wrong while trying to play click sound")
            }
        }
    }
    
    
    
    
}
