//
//  ContactTableViewCell.swift
//  Homework2
//
//  Created by Alexandr Onischenko on 01.07.2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func setData(contact: ContactCell) {
        nameLabel.text = contact.name
        numberLabel.text = contact.number
    }
 
}
