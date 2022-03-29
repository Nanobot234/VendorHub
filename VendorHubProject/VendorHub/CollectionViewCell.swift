//
//  VendorHeaderRow.swift
//  VendorHub
//
//  Created by Nana Bonsu on 3/25/22.
//

import Foundation
import UIKit


class CollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet var myImage:UIImageView!
    let storyboard = UIStoryboard(name:"CustomerUserFlow", bundle: nil)
    
    
   //  var viewController:CustomerHomePageController = CustomerHomePageController(nibName: nil, bundle: nil)
   
    static let indentifier = "CollectionViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "CollectionView", bundle:nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib() //get an excplkanation for thi
        
        myImage.isUserInteractionEnabled = true
        
        myImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap)))
        
    }
    
    public func configure(with model:Model) {
        self.myImage.image = UIImage(named: model.imageName)
        self.myImage.contentMode =  .scaleAspectFill
        
    }
    
    @objc public func imageTap() {
        print("Tapped")
        //let newView = storyboard.instantiateViewController(withIdentifier: "vendorItemsView") as! CustomerHomePageController
    
       // newView.present(, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
       
       
    }
    
    
    //create  table vieww cell
}
