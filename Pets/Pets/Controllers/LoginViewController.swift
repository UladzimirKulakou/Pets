//
//  LoginViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/2/21.
//
import Firebase
import UIKit

class LoginViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference(withPath: "users")

        // если у нас еще есть действующий user то сделаем переход
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let _ = user else { return }
            self?.performSegue(withIdentifier: Constants.Segues.tasks, sender: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // чистим поля
        emailTF.text = ""
        passwordTF.text = ""
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        // проверяем все поля
        guard let email = emailTF.text, let password = passwordTF.text, email != "", password != "" else {
            // показываем уникальный error
            displayWarningLabel(withText: "info is incorrect")
            return
        }

        // логинемся
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if let _ = error {
                self?.displayWarningLabel(withText: "Error ocured")
            } else if let _ = user {
                // переходим на новый экран
                self?.performSegue(withIdentifier: Constants.Segues.tasks, sender: nil)
                return
            } else {
                self?.displayWarningLabel(withText: "No such user")
            }
        }
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        // проверяем все поля
        guard let email = emailTF.text, let password = passwordTF.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }

        // createUser
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
            if let error = error {
                self?.displayWarningLabel(withText: "Registration was incorrect\n\(error.localizedDescription)")
            } else {
                guard let user = user else { return }
                let userRef = self?.ref.child(user.user.uid)
                userRef?.setValue(["email": user.user.email])
            }
        }
    }

    // MARK: Private

    private func displayWarningLabel(withText text: String) {
        warnLabel.text = text
        // curveEaseInOut - плавно появляется и плавно исчезает
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in self?.warnLabel.alpha = 1 }) { [weak self] _ in
            self?.warnLabel.alpha = 0
        }
    }
}
