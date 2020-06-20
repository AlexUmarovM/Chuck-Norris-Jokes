//
//  networkManager.swift
//  Chuck Norris Jokes
//
//  Created by Александр Умаров on 19.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import Foundation
    
private let jsonUrl = "https://api.chucknorris.io/jokes/random"


extension ViewController {
    
    
func fetchData() {
          guard let url = URL(string: jsonUrl) else { return }
          
          URLSession.shared.dataTask(with: url) { (data, _, _) in
              guard let data = data else { return }
              
              let decoder = JSONDecoder()
              
              do {
                self.jokeChuck = try decoder.decode(Joke.self, from: data)
              } catch let error {
                  print(error.localizedDescription)
              }
              
          }.resume()
         JokesList.shared.imageURL = jokeChuck?.icon_url
      }
    
}

