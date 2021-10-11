//
//  ErrorViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/11/21.
//

import UIKit

class ErrorViewController: UIViewController {
    
    
    @IBOutlet weak var errorImage: UIImageView!
    
    @IBOutlet weak var reloadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorImage.image = UIImage(named: "errorImage")
        errorImage.layer.cornerRadius = 10
        reloadButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reloadDataButton() {
        ParsingServices.getMarkets()
        guard let vc = storyboard?.instantiateViewController(identifier: "welcomVC1") as? ViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
