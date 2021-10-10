//
//  ParsingServices.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/8/21.
//

import Foundation

class ParsingServices {
    static var market: [Market] = []
    static var pharms: [Pharm] = []
    static var prices: [PharmPrice] = []
    
    static func getMarkets() {

        guard let url = URL(string: APIConstants.marketPath) else { return }

            let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                print(data)
                do {
                    ParsingServices.market = try JSONDecoder().decode([Market].self, from: data)
                } catch let error {
                    print(error)
                }
                    DispatchQueue.main.async {
                    }
        
            }
            task.resume()
           }
    static func getPharms() {

        guard let url = URL(string: APIConstants.pharmsPath) else { return }

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
    static func getPrices() {

        guard let url = URL(string: APIConstants.pharmsPrices) else { return }

            let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                print(data)
                do {
                    ParsingServices.market = try JSONDecoder().decode([Market].self, from: data)
                } catch let error {
                    print(error)
                }
                    DispatchQueue.main.async {
                    }
        
            }
            task.resume()
           }

}
