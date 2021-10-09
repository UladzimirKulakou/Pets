//
//  ParsingServices.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/8/21.
//

import Foundation

class ParsingServices {
    static var market: [Market] = []
    
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
            }
            task.resume()
           }
}
