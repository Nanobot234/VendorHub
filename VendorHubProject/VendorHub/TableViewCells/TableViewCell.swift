//
//  TableViewCell.swift
//  VendorHub
//
//  Created by Nana Bonsu on 3/27/22.
//

import Foundation

import UIKit


class CollectionTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CollectionTableViewCell"
    
    
    @IBOutlet weak var mycollectionView: UICollectionView!
    
    
    var vendorItems = [Model]()
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib() //get an excplkanation for thi
        
        //the register connects the colleciton View object with the required type
        
        mycollectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.indentifier)
        
        mycollectionView.delegate = self
        mycollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    func configure(with models: [Model]) {
        self.vendorItems = models
        mycollectionView.reloadData() //incase of problems?
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendorItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.indentifier, for: indexPath) as! CollectionViewCell
        cell.configure(with: vendorItems[indexPath.row])
        return cell
    }
    
    //the size of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
  
    
    //create  table vieww cell
}

