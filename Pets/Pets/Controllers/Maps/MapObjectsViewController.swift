//
//  MapObjectsViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/10/21.
//

import UIKit

import MapKit

class MapObjectsViewController: UIViewController {
   
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var refreshButton: UIButton!
    
    var cityIndex: Int = 0
    var marketsCoordinate = MKPointAnnotation()
    var markets:[Market]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.layer.cornerRadius = 10
        
        
        mapView.showsUserLocation = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        ParsingServices.getMarketsCoordinate(marketCityIndex: cityIndex)
    }
    
    
    
    func setCoordinate(marketsArray: [Market]) {
        
        for elementOfArray in marketsArray {
            marketsCoordinate.coordinate.latitude = elementOfArray.latitude
            marketsCoordinate.coordinate.longitude = elementOfArray.longitude
            let point = MKPointAnnotation()
            point.coordinate.longitude = marketsCoordinate.coordinate.longitude
            point.coordinate.latitude = marketsCoordinate.coordinate.latitude
            
            point.title = elementOfArray.marketName
            point.subtitle = elementOfArray.phone
            
            self.mapView.addAnnotation(point)
        }
    
    }
    @IBAction func refresh(_ sender: Any) {
        markets = ParsingServices.market
        setCoordinate(marketsArray: markets)
        
    }
    
    
    
    
}
