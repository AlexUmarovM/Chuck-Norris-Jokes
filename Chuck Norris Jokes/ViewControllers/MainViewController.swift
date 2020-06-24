//
//  ViewController.swift
//  Chuck Norris Jokes
//
//  Created by Александр Умаров on 19.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import Spring
import AVFoundation

class MainViewController: UIViewController {
    
    @IBOutlet var feastView: SpringImageView!
    @IBOutlet var jokeLabel: UILabel!
    @IBOutlet var jokeButton: UIButton!
    var audioPlayer = AVAudioPlayer()
    var jokeChuck: String?
    var beatSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "beat", ofType: "mp3") ?? "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beat()
        do {
            audioPlayer = try AVAudioPlayer (contentsOf: beatSound as URL, fileTypeHint: nil)
            audioPlayer.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }
        NetworkManager.shared.fetchData()
        jokeLabel.text = "I'am Texas Ranger, son!"
        jokeButton.layer.cornerRadius = 10
    }
    
    func beat() {
        feastView.animation = Spring.AnimationPreset.ZoomOut.rawValue
        feastView.duration = 2.3
        feastView.force = 1.5
        feastView.animate()
    }
    
    
    @IBAction func beatAction(_ sender: Any) {
        feastView.isHidden = false
        beat()
        audioPlayer.play()
        NetworkManager.shared.fetchData()
        jokeChuck = JokesList.shared.jokes.last
        jokeLabel.text = jokeChuck ?? ""
    }
    
}


