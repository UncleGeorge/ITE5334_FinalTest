
import Foundation
import AVFoundation

class SoundManager {
    
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?
    
    private init() {
        setupAudioPlayer()
    }
    
    private func setupAudioPlayer() {
    
        var soundFileURL = Bundle.main.url(forResource: "click", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundFileURL!)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }

    }
    
    func playClickSound() {
        if UserDefaults.standard.bool(forKey: "soundEffectEnabled") {
            audioPlayer?.play()
        }
    }
}
