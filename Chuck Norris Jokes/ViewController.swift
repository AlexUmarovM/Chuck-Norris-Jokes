//
//  ViewController.swift
//  Chuck Norris Jokes
//
//  Created by Александр Умаров on 19.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import Spring
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var feastView: SpringImageView!
    @IBOutlet var jokeLabel: UILabel!
    @IBOutlet var jokeButton: UIButton!
    var beatSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "beat", ofType: "mp3") ?? "")
    var audioPlayer = AVAudioPlayer()
    var jokeChuck: Joke?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beat()
        do {
            audioPlayer = try AVAudioPlayer (contentsOf: beatSound as URL, fileTypeHint: nil)
            audioPlayer.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }
        jokeLabel.text = "I'am Texas Ranger, son!"
        jokeButton.layer.cornerRadius = 10
        fetchData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        fetchData()
        JokesList.shared.joke = jokeChuck?.value ?? ""
        JokesList.shared.jokes += [jokeChuck?.value ?? ""]
        JokesList.shared.imageURL = jokeChuck?.icon_url
        jokeLabel.text = jokeChuck?.value ?? ""
    }
    
}


