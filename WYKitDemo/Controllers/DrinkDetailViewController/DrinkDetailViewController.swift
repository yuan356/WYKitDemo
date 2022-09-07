//
//  DrinkDetailViewController.swift
//  MilkShopping
//
//  Created by Will on 2022/9/6.
//

import UIKit

class DrinkDetailViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var drink: Drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
    }
    
    private func setValue() {
        nameLabel.text = drink.fields.name
        coverImageView.downloaded(from: drink.fields.image[0].url)
        contentLabel.text = drink.fields.note
        amountLabel.text = "$\(drink.fields.amount)"
    }

    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addToCart(_ sender: Any) {
        let acsv = AddCartSuccessView()
        self.view.addSubview(acsv)
        acsv.fillSuperview()
    }
    
}
