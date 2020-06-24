//
//  networkManager.swift
//  Chuck Norris Jokes
//
//  Created by Александр Умаров on 19.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit
import Alamofire

private let jsonUrl = "https://api.chucknorris.io/jokes/random"


class NetworkManager {
    static let shared = NetworkManager()
    func fetchData() {
        AF.request(jsonUrl)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard  let jsonData = value as? [String: Any] else { return }
                    for data in jsonData {
                        switch data.key {
                        case "value":
                            let joke = data.value as? String ?? ""
                            JokesList.shared.jokes.append(joke)
                        case "icon_url":
                            let imageUrl = data.value
                            JokesList.shared.imageURL = imageUrl as? String ?? ""
                        default:
                            break
                        }
                    }
                case .failure(let error):
                    print(error)
                }
        }
    }
    
}
