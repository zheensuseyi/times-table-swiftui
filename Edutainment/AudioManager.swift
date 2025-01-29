//
//  AudioManager.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 1/7/25.
//

import SwiftUI
import AVFoundation

class AudioManager: ObservableObject {
    var player: AVAudioPlayer?

    // Load and prepare audio for playback
    func loadAudio(filename: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            print("Audio file not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
        }
    }

    // Play the audio
    func playAudio() {
        player?.play()
    }

    // Pause the audio
    func pauseAudio() {
        player?.pause()
    }

    // Stop the audio
    func stopAudio() {
        player?.stop()
    }
}
