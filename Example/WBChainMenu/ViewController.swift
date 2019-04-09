//
//  ViewController.swift
//  WBChainMenu
//
//  Created by Muhammad Waqas on 2/16/19.
//  Copyright © 2019 Muhammad Waqas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.cellId) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(_imageNames: ["share","star","play","bell"], index: indexPath.row)
        cell.layoutIfNeeded()
        return cell
    }
    
}



