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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

