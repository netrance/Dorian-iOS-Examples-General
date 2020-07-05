//
//  ViewController.swift
//  UISearchBarEx
//
//  Created by Dorian Lee on 2020/07/03.
//  Copyright © 2020 Dorian Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sbExample: UISearchBar!
    @IBOutlet var tbExample: UITableView!

    var queryTimer: Timer?

    var recentSearchWord = ""
    var shownCities = [String]()
    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga", "Seoul", "Tokyo", "Beijing", "Hong Kong", "Taipei", "Hanoi", "Jakarta", "Singapore", "Bangalore", "Canberra"]

    override func viewDidLoad() {
        super.viewDidLoad()

        sbExample.delegate = self
        tbExample.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        return cell
    }

}

extension ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let currentSearchWord = searchText

        if (currentSearchWord == recentSearchWord) {
            return
        }
        else if (currentSearchWord.isEmpty) {
            return
        }
        else if (nil != queryTimer) {
            queryTimer?.invalidate()
            queryTimer = nil
        }

        queryTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.shownCities = self.allCities.filter { $0.contains(searchBar.text!) }
            self.tbExample.reloadData()
        }
    }

}
