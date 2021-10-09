//
//  TestViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/8/21.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var marketInfo: UILabel!
    var text: [Market] = []
    var textForLabel: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ParsingServices.getMarkets()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func getMarketInfo(_ sender: Any) {
        var n = 0
        text = ParsingServices.market
        for market in text {
            for pharms in market.pharms {
                if pharms.pharmsShortName == "Бравекто" {
                    n += 1
                    textForLabel += "\(n). " + market.marketName + " цена: " + "\(pharms.marketPrice) "
                }
            }
        }
        marketInfo.text = textForLabel
    }
    
}
