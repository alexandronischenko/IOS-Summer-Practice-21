//
//  DetailsViewController.swift
//  Homework2
//
//  Created by Alexandr Onischenko on 01.07.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var workPlaceLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
     
    var contact: ContactCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = contact?.name
        numberLabel.text = contact?.number
        workPlaceLabel.text = contact?.workPlace
        descriptionTextView.text = contact?.description
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
