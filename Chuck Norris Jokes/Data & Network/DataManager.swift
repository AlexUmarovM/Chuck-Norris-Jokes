//
//  DataManager.swift
//  Chuck Norris Jokes
//
//  Created by Александр Умаров on 19.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class JokesList {
  static let shared = JokesList()

    var jokes: [String] = []
    var imageURL: String?
    var numberOfJokes = 0
    
    func jokeCount() -> Int {
           numberOfJokes += 1
           return numberOfJokes
       }
}


