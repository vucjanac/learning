//
//  ViewController.swift
//  Zadatak2.1
//
//  Created by Aleksandar Stojanovic on 10/10/21.
//

import UIKit
import SwiftUI

class ViewController: UITableViewController {
    
    var stores: [Store] = []
    var store: [Stores] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
        tableView.register(StoreCell.self, forCellReuseIdentifier: "StoreCell")
        
        
        let urlString = "http://sandbox.bottlerocketapps.com/BR_Android_CodingExam_2015_Server/stores.json"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        
        func parse(json: Data) {
            let decoder = JSONDecoder()
            
            if let jsonStore = try? decoder.decode(Stores.self, from: json) {
                stores = jsonStore.stores
                tableView.reloadData()
            }
        }
        
        func setTableViewDelegates() {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return stores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let storeCell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath)
        let store = stores[indexPath.row]
        storeCell.textLabel?.text = store.name
       
        
        return storeCell
    }
}
