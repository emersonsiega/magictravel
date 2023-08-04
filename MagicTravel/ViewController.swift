//
//  ViewController.swift
//  MagicTravel
//
//  Created by emersonsiega on 03/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    // IB -> Interface builder
    // It's a connection to the TableView at the UI
    //
    // To connect with the UI:
    // - Right click on TableView at the UI
    // - New Referencing Outlet
    // - Drag over the ViewController
    // - Select "countriesTableView"
    @IBOutlet var countriesTableView: UITableView!
    
    // Model from MVC
    var countries = [
        "Germany", "France", "China", "Brazil", "Australia", "India",
        "Canada", "USA", "Mexico", "Ghana", "Egypt", "Argentina"
    ]
    
    var countryContinent: [String: String] = [
        "Germany": "Europe", "France": "Europe", "China": "Asia", "Brazil": "South America",
        "Australia": "Oceania", "India": "Asia", "Canada": "North America",
        "USA": "North America", "Mexico": "North America", "Ghana": "Africa",
        "Egypt": "Africa", "Argentina": "South America"
    ]
    
    struct Constants {
        static let cellIdentifier = "CountryCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Other way to connect the controller to the UI
        //countriesTableView.dataSource = self
        //countriesTableView.delegate = self
        
        countriesTableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }
}

// Adds a datasourte to the UITableView
// As the "countriesTableView" needs to be connected to the outlet in the UI
//
// To connect with the UI:
// - Right click on TableView at the UI
// - Outlets -> Datasource
// - Drag over the ViewController
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell -> will mount the necessary cells in the UI and,
        // if necessary (a.k.a. user scrolls), will reuse the cells to display different data
        let tableViewCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        )
        
        // Creates a default content configuration, assigns a text to it and add it back to the cell
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let countryName = countries[indexPath.row]
        cellContentConfiguration.text = countryName
        cellContentConfiguration.secondaryText = countryContinent[countryName] ?? "Unknown"
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

// Handle interactions with the UITableView
// Also needs to be connected in the UI, by selecting the "Outlets -> Delegate" option
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
