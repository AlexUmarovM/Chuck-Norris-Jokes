//
//  fullJokeViewController.swift
//  Chuck Norris Jokes
//
//  Created by Александр Умаров on 20.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class FullJokeViewController: UIViewController {
    @IBOutlet var fullJokeLabel: UILabel!
    var fullJoke: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullJokeLabel.text = fullJoke
    }
}
