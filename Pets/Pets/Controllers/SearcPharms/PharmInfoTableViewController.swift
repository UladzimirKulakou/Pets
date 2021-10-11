//
//  PharmInfoTableViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/11/21.
//

import UIKit

class PharmInfoTableViewController: UITableViewController {

    var pharm: Pharm?
    var pharmPrice:[Double]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllPharmsPrices(index: pharm!.pharmsID)
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmPrice.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InfoPharmCell
        let pharm = ParsingServices.prices[indexPath.row]
       cell.configure(with: pharm)
       return cell
    }

    private func getAllPharmsPrices(index: Int) {

        guard let url = URL(string: "http://192.168.0.121:3000/pharmPrice?pharmsID=\(index)") else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                ParsingServices.prices = try JSONDecoder().decode([PharmPrice].self, from: data)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                
                for element in ParsingServices.prices {
                    self.pharmPrice.append(element.marketPrice)
                    
                    
                    
                }
                self.tableView.reloadData()
            }

        }
        task.resume()
    }
}

