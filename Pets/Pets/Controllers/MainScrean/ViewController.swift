//
//  ViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 9/28/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    var text: String = "Апоквел"

    @IBOutlet weak var welcomLabel: UILabel!
    // @IBOutlet weak var welcomImage: UIImageView!
    // @IBOutlet weak var singInButton: UIButton!
    //    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var personDataImage: UIImageView!
    @IBOutlet weak var searchDataImage: UIImageView!
    @IBOutlet weak var qrReaderImage: UIImageView!
    @IBOutlet weak var mapImage: UIImageView!
    
    @IBOutlet weak var smallSearchButtonOutlet: UIButton!
    @IBOutlet weak var searchTextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // ParsingServices.getMarkets()
        searchTextFieldOutlet.text = text
        searchTextFieldOutlet.layer.cornerRadius = 10
        searchTextFieldOutlet.layer.borderWidth = 1
        searchTextFieldOutlet.layer.borderColor = CGColor(red: 0.18, green: 0.32, blue: 0.42, alpha: 1.00)
        searchTextFieldOutlet.layer.cornerRadius = 10
        smallSearchButtonOutlet.layer.cornerRadius = 10
        welcomLabel.layer.cornerRadius = 10

        //        welcomImage.image = UIImage(named: "Image_4")
        ////        singInButton.layer.frame = CGRect(x: 0, y: 0, width: 343, height: 43)
        //        singInButton.layer.backgroundColor = UIColor(red: 0.216, green: 0.725, blue: 0.773, alpha: 1).cgColor
        //        singInButton.layer.cornerRadius = 20
        //        singInButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)

//        let button = UIButton(type: .roundedRect)
//        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
//        button.setTitle("Test Crash", for: [])
//        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
//        view.addSubview(button)
//      Настраиваем кнопки на главном экране
        
        
        personDataImage.image = UIImage(named: "FirstVCimage_4")
        personDataImage.layer.borderWidth = 1
        personDataImage.layer.borderColor = CGColor(red: 0.18, green: 0.32, blue: 0.42, alpha: 1.00)
        personDataImage.layer.cornerRadius = 10

        searchDataImage.image = UIImage(named: "FirstVCimage_1")
        searchDataImage.layer.borderWidth = 1
        searchDataImage.layer.borderColor = CGColor(red: 0.18, green: 0.32, blue: 0.42, alpha: 1.00)
        searchDataImage.layer.cornerRadius = 10

        qrReaderImage.image = UIImage(named: "FirstVCimage_3")
        qrReaderImage.layer.borderWidth = 1
        qrReaderImage.layer.borderColor = CGColor(red: 0.18, green: 0.32, blue: 0.42, alpha: 1.00)
        qrReaderImage.layer.cornerRadius = 10

        mapImage.image = UIImage(named: "FirstVCimage_2")
        mapImage.layer.borderWidth = 1
        mapImage.layer.borderColor = CGColor(red: 0.18, green: 0.32, blue: 0.42, alpha: 1.00)
        mapImage.layer.cornerRadius = 10

        let login = UITapGestureRecognizer(target: self, action: #selector(logInButtonTapped))
        personDataImage.addGestureRecognizer(login)
        personDataImage.isUserInteractionEnabled = true
        
        let map = UITapGestureRecognizer(target: self, action: #selector(mapButtonTapped))
        mapImage.addGestureRecognizer(map)
        mapImage.isUserInteractionEnabled = true
        
        let search = UITapGestureRecognizer(target: self, action: #selector(searchButtonTapped))
        searchDataImage.addGestureRecognizer(search)
        searchDataImage.isUserInteractionEnabled = true
        
        let qr = UITapGestureRecognizer(target: self, action: #selector(qrButtonTapped))
        qrReaderImage.addGestureRecognizer(qr)
        qrReaderImage.isUserInteractionEnabled = true

    }

    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let numbers = [0]
        let _ = numbers[1]
    }
    @objc func logInButtonTapped() {
        
            guard let vc = storyboard?.instantiateViewController(identifier: "loginVC") as? LoginViewController else { return }
            navigationController?.pushViewController(vc, animated: true)

        
    }
    @objc func mapButtonTapped() {
     
            guard let vc = storyboard?.instantiateViewController(identifier: "mapVC1") as? FirstMapViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
    
    }
    @objc func searchButtonTapped() {
     //   ParsingServices.getAllPharms()
     //   ParsingServices.getAllPharms()
        guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
        vc.textFromSmallButton = 30
            navigationController?.pushViewController(vc, animated: true)
        }
    
    
    @objc func qrButtonTapped() {
            guard let vc = storyboard?.instantiateViewController(identifier: "qrVC") as? QRViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            // show onboarding
            let vc = storyboard?.instantiateViewController(identifier: "welcom") as! WelcomViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }

    @IBAction func smallSearchButtonTapped(_ sender: Any) {
        if searchTextFieldOutlet.text == "Бравекто" {
        guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
        vc.textFromSmallButton = 0
            navigationController?.pushViewController(vc, animated: true)
        } else { if searchTextFieldOutlet.text == "Азинокс" {
            guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
            vc.textFromSmallButton = 1
                navigationController?.pushViewController(vc, animated: true)
        } else {
             if searchTextFieldOutlet.text == "Апоквел" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 2
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Вазосан" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 3
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Гельмимакс" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 4
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Дехинел" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 5
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Диаркан" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 6
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Баюн" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 7
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Марфлоксин" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 8
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Мексидол" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 9
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Милпразон" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 10
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Онсиор" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 11
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Римадил" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 12
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Фитокальцевит" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 13
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Превикокс" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 14
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Празител" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 15
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Симпарика" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 16
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Сульф" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 17
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Фетбал" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 18
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Ципровет" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 19
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Энроксил" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 20
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Ципровет" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 21
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Анандин" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 22
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Барс" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 23
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Ирис" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 24
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Отоферонол" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 25
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Фитэкс" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 26
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Адвантейдж" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 27
                    navigationController?.pushViewController(vc, animated: true)
            } else {if searchTextFieldOutlet.text == "Дана" {
                guard let vc = storyboard?.instantiateViewController(identifier: "pharmaVC") as? PharmacyTableViewController else { return }
                vc.textFromSmallButton = 28
                    navigationController?.pushViewController(vc, animated: true)
            } else {  guard let vc = storyboard?.instantiateViewController(identifier: "errorVC") as? ErrorViewController else { return }
                        navigationController?.pushViewController(vc, animated: true)
                    
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
                
            }
            
        }
    }
    }
    
//
    
}

class Core {
    static let shared = Core()

    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    func setIsNotNewUsers() {
        UserDefaults.standard.setValue(true, forKey: "isNewUser")
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextFieldOutlet.resignFirstResponder()
        return true
    }
}


