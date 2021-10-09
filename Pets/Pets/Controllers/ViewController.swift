//
//  ViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 9/28/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomImage: UIImageView!
    @IBOutlet weak var singInButton: UIButton!
    //    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
//
        profileImageView.image = UIImage(named: "Image_4")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(singInButtonTapped))
        profileImageView.addGestureRecognizer(tap)
        profileImageView.isUserInteractionEnabled = true
        
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let numbers = [0]
        let _ = numbers[1]
    }
    @objc func singInButtonTapped() {
        if Auth.auth().currentUser != nil {
            return
            // прописать переход на экран пользователя
        } else {
            guard let vc = storyboard?.instantiateViewController(identifier: "loginVC") as? LoginViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
            
        }
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

