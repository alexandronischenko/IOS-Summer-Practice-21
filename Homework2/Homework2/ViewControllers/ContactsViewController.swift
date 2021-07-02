//
//  ContactsViewController.swift
//  Homework2
//
//  Created by Alexandr Onischenko on 01.07.2021.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    var data: [ContactCell] = [ContactCell(name: "Alexandr", number: "987654321", description: "Чел во👍", workPlace: "Программист"),
                               ContactCell(name: "Nikita", number: "123456768", description: "Know I've done wrong, left your heart torn\n Is that what devils do?\n Took you so low, where only fools go\n Can you love me again?", workPlace: "Бездельник"),
                               ContactCell(name: "Oleg", number: "987654321", description: "Ауф☝️", workPlace: "Программист"),
                               ContactCell(name: "Vasiliy", number: "123456768", description: "Чел во👍", workPlace: "Врча"),
                               ContactCell(name: "Petr", number: "987654321", description: "Чел ✌️", workPlace: "Учитель"),
                               ContactCell(name: "Kto", number: "123456768", description: "Чел во👍", workPlace: "Кто это")]
}

extension ContactsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return }
        
        detailsViewController.contact = data[indexPath.row]
        present(detailsViewController, animated: true)
    }
} 

extension ContactsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as? ContactTableViewCell else { return UITableViewCell()}
        cell.setData(contact: data[indexPath.row])
        return cell
    }
}

struct ContactCell{
    let name: String
    let number: String
    let description: String
    let workPlace: String
}

