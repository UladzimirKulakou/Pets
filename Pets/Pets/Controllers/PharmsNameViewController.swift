//
//  PharmsNameViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/11/21.
//

import UIKit

//class PharmsNameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//
//
//    var pharmacyArray: [String] = []
//    var marketsArray: [String] = []
//    var priceArray: [Double] = []
//    var searchinPharmacy: [Pharm] = []
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //  table
//        getAllPharms()
//
//        // Do any additional setup after loading the view.
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        searchinPharmacy = ParsingServices.pharms
//        for element in searchinPharmacy {
//            pharmacyArray.append(element.pharmsName)
//            //     priceArray.append(element.pharmsID)
//
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pharmacyArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PharmCell
//        let pharm = searchinPharmacy[indexPath.row]
//        cell.configure(with: pharm)
//        return cell
//    }
//    private func getAllPharms() {
//
//        guard let url = URL(string: "\(APIConstants.pharmsPath)") else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
//            guard let data = data else { return }
//            print(data)
//            do {
//                ParsingServices.pharms = try JSONDecoder().decode([Pharm].self, from: data)
//            } catch let error {
//                print(error)
//            }
//            DispatchQueue.main.async {
////                   self.tableView.reloadData()
//            }
//
//        }
//        task.resume()
//    }
//}
