//
//  CustomerHomePageController.swift
//  VendorHub
//
//  Created by Nana Bonsu on 3/21/22.
//

import Foundation
import UIKit



class CustomerHomePageController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var vendorItems = [Model]()
    
    
    var vendorPositon = ["Vendor 1","Vendor 2","Vendor 3","Vendor 4","Vendor5"]
    
   @IBOutlet var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding model objects with images to the Items
        
        vendorItems.append(Model(imageName: "Image1"))
        
        vendorItems.append(Model(imageName: "Image2"))
        
        vendorItems.append(Model(imageName: "Image3"))
        
        vendorItems.append(Model(imageName: "Image4"))
        
        vendorItems.append(Model(imageName: "Image5"))
            
            
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //
        
    }
    //tableview sections

    func numberOfSections(in tableView: UITableView) -> Int {
        return vendorPositon.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.configure(with: vendorItems) //puts the items in the collectionView?
        return cell
    }
    
    //to set the title of each row of tableView
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return vendorPositon[section]
        }
    
    //sets the row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    //Collection View inside a table view
    
    
    //But will need  page where to upload items, or can mually do i
    
    public func gotoImageDetails() {
        self.performSegue(withIdentifier: "itemDetailsView", sender: self)
        
    }
    
    
    
  

//this ia going to be the image that we are getting from firebase, for the ros

}
struct Model {
    let imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    
}

