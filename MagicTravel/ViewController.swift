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
    
    struct Constants {
        static let cellIdentifier = "CountryCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 1
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
        
        
        return tableViewCell
    }
    
    
}

