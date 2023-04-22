
import Foundation
import AVFoundation

class SoundManager {
    
    // Implement the singleton pattern by defining a static property called "shared"
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?
    
    // ensure SoundManager can only be instantiated internally, guarantees only one instance exists
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
        // If the user has set button sound effect, will be played on click
        if UserDefaults.standard.bool(forKey: "soundEffectEnabled") {
            audioPlayer?.play()
        }
    }
}
