//
//  TasksViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/3/21.
//
import Firebase
import UIKit

class TasksViewController: UIViewController {
    // MARK: Internal

    var user: User!
    var ref: DatabaseReference!
    var tasks = [Task]()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // достаем текущего пользователя
        guard let currentUser = Auth.auth().currentUser else { return }
        // сохраним currentUser
        user = User(user: currentUser)
        // создаем reference
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // наблюдатель за значениями
        ref.observe(.value) { [weak self] snapshot in
            var tasks = [Task]()
            for item in snapshot.children { // вытаскиваем все tasks
                guard let snapshot = item as? DataSnapshot, let task = Task(snapshot: snapshot) else { continue }
                tasks.append(task)
            }
            self?.tasks = tasks
            self?.tableView.reloadData()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // удаляем всех Observers
        ref.removeAllObservers()
    }

    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New task", message: "Add new task", preferredStyle: .alert)
        alertController.addTextField()
        // action 1
        let save = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            // достали text
            guard let textField = alertController.textFields?.first,
                  let text = textField.text,
                  let uid = self?.user.uid else { return }
            // создаем задачу
            let task = Task(title: text, userId: uid)
            // где хранится на сервере
            let taskRef = self?.ref.child(task.title.lowercased()) // нижний регистр
            // добавляем на сервак
            taskRef?.setValue(task.convertToDictionary()) // помещаем словарь по ref
        }
        // action 2
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(save)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }

    @IBAction func signOutTapped(_ sender: UIBarButtonItem) {
        do {
            // выходим из Auth.auth()
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        // закрываем экран
        dismiss(animated: true, completion: nil)
    }

    // MARK: Private

    private func toggleCompletion(_ cell: UITableViewCell, isCompleted: Bool) {
        cell.accessoryType = isCompleted ? .checkmark : .none
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        let currentTask = tasks[indexPath.row]
        cell.textLabel?.text = currentTask.title
        toggleCompletion(cell, isCompleted: currentTask.completed)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete { return }
        let task = tasks[indexPath.row]
        // удаление
        task.ref?.removeValue()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let task = tasks[indexPath.row]
        let isCompleted = !task.completed

        // изменяем ячейку
        toggleCompletion(cell, isCompleted: isCompleted)
        // меняем isCompleted
        task.ref?.updateChildValues(["completed": isCompleted])
    }
}
