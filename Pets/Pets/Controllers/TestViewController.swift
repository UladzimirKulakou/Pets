//
//  TestViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/8/21.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var marketInfo: UILabel!
    var text: [Pharm] = []
    var textForLabel: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ParsingServices.getPharms()
        
        // Do any additional setup after loading the view.
    }
    
    private func getPharmName() {
        let url = "\(APIConstants.pharmsPath)"
        guard let url = URL(string: url) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                ParsingServices.pharms = try JSONDecoder().decode([Pharm].self, from: data)
            } catch let error {
                print(error)
            }
                DispatchQueue.main.async {
                }
    
        }
        task.resume()
        
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
        text = ParsingServices.pharms
        for pharm in text {
            n+=1
            textForLabel += "\(n)" + " \(pharm.pharmsShortName) "
            }
        marketInfo.text = textForLabel
        }
       
    }

