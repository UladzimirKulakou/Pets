//
//  PharmacyTableViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/9/21.
//

import UIKit

class PharmacyTableViewController: UITableViewController {

    var pharmacyArray: [String] = []
    var marketsArray: [String] = []
    var priceArray: [Double] = []
    var searchinPharmacy: [Pharm] = []
    var textFromSmallButton: Int = 0
//var element = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        if textFromSmallButton == 0 {
        getAllPharms()
        } else {
            getAllPharms(textFromSmallButton: textFromSmallButton)
        }
    }

    // MARK: - Table view data source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let desination = segue.destination as? PharmInfoTableViewController,
            let pharm = sender as? Pharm {
            desination.pharm = pharm
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pharmacyArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PharmCell
        let pharm = searchinPharmacy[indexPath.row]
        cell.configure(with: pharm)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pharm = searchinPharmacy[indexPath.row]
        performSegue(withIdentifier: "showPharInfo", sender: pharm)
    }
    

    private func getAllPharms() {

        guard let url = URL(string: "\(APIConstants.pharmsPath)") else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                ParsingServices.pharms = try JSONDecoder().decode([Pharm].self, from: data)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                self.searchinPharmacy = ParsingServices.pharms
                for element in self.searchinPharmacy {
                    self.pharmacyArray.append(element.pharmsName)
                }
                self.tableView.reloadData()
            }

        }
        task.resume()
    }
    private func getAllPharms(textFromSmallButton: Int) {

        guard let url = URL(string: "\(APIConstants.pharmsPath)?pharmsID=\(textFromSmallButton)") else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                ParsingServices.pharms = try JSONDecoder().decode([Pharm].self, from: data)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                self.searchinPharmacy = ParsingServices.pharms
                for element in self.searchinPharmacy {
                    self.pharmacyArray.append(element.pharmsName)
                }
                self.tableView.reloadData()
            }

        }
        task.resume()
    }
}
