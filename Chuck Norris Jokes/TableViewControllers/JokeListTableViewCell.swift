//
//  JokeListTableViewCell.swift
//  Chuck Norris Jokes
//
//  Created by Александр Умаров on 20.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class JokeListTableViewCell: UITableViewCell {
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var cellView: UIImageView!
    
      func getImage(){
        DispatchQueue.global().async {
            guard let stringURL = JokesList.shared.imageURL else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.cellView.image = UIImage(data: imageData)
            }
        }
    }
}
