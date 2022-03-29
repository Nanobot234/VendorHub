//
//  VendorFunctionController.swift
//  VendorHub
//
//  Created by Nana Bonsu on 3/16/22.
//

import Foundation
import UIKit


class VendorFunctionController: UIViewController {
    
    
   
    @IBOutlet weak var LocationTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        LocationTableView.dataSource = self
        LocationTableView.delegate = self
    }
    
}

extension VendorFunctionController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "item: \(indexPath.item)"
        return cell
    }
    
    
    
}
