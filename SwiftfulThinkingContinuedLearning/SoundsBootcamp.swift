//
//  SoundsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Alex Kolsa on 14.09.2022.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOptions: String {
        case cow
        case duck
    }
    
    func playSound(sound: SoundOptions) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
}

struct SoundsBootcamp: View {
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Play sound 1") {
                SoundManager.shared.playSound(sound: .cow)
            }
            Button("Play sound 2") {
                SoundManager.shared.playSound(sound: .duck)
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
