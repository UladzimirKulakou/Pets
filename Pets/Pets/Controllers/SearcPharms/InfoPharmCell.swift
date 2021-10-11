//
//  InfoPharmCell.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/11/21.
//

import Foundation
import UIKit

class InfoPharmCell: UITableViewCell {

    @IBOutlet weak var marketName: UILabel!
    
    @IBOutlet weak var marketPhone: UILabel!
    @IBOutlet weak var marketPrice: UILabel!
    
    
    func configure(with pharm: PharmPrice) {
        marketName.text = pharm.marketName
        marketPhone.text = pharm.phone
        marketPrice.text = String(pharm.marketPrice)
    //    shorName.text = pharm.minmaxPrice
    }
}
