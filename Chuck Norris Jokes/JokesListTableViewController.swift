//
//  JokesListTableViewController.swift
//  Chuck Norris Jokes
//
//  Created by Александр Умаров on 19.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class JokesListTableViewController: UITableViewController {

    var jokesList: [String] = []
    var numberOfJokes = 0
    override func viewDidLoad() {
        super.viewDidLoad()
         jokesList += JokesList.shared.jokes
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesList.count
    }

    func jokeCount() -> Int {
        numberOfJokes += 1
        return numberOfJokes
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath) as! JokeListTableViewCell
        cell.getImage()
        cell.cellLabel.text = "Joke : \(jokeCount())"

        return cell
    }
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               guard let indexPath = tableView.indexPathForSelectedRow else { return }
               if segue.identifier == "fullJoke" {
                   let fullJokeVC = segue.destination as! fullJokeViewController
                fullJokeVC.joke = JokesList.shared.jokes[indexPath.row]
                   }
           }
}
