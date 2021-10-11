//
//  PharmCell.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/11/21.
//

import Foundation
import UIKit

class PharmCell: UITableViewCell {

    @IBOutlet var pharmName: UILabel!
    @IBOutlet var shorName: UILabel!

    func configure(with pharm: Pharm) {
        pharmName.text = pharm.pharmsName
        shorName.text = pharm.minmaxPrice
    }
}
