//
//  FirstMapViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/10/21.
//

import UIKit

class FirstMapViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "minsk" {
           if let mapVC = segue.destination as? MapObjectsViewController {
           mapVC.cityIndex = 0
            }
        }
        if segue.identifier == "grodno" {
            if let mapVC = segue.destination as? MapObjectsViewController {
            mapVC.cityIndex = 1
             }
         }
        if segue.identifier == "mogilev" {
            if let mapVC = segue.destination as? MapObjectsViewController {
            mapVC.cityIndex = 2
             }
         }
        if segue.identifier == "vitebsk" {
            if let mapVC = segue.destination as? MapObjectsViewController {
            mapVC.cityIndex = 3
             }
         }
    }
}
