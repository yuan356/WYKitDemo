//
//  DrinkCell.swift
//  MilkShopping
//
//  Created by Will on 2022/9/5.
//

import UIKit

class DrinkCell: UITableViewCell {

    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var drink: Drink! {
        didSet {
            titleLabel.text = drink.fields.name
            amountLabel.text = "$\(drink.fields.amount)"
            drinkImageView.downloaded(from: drink.fields.image[0].url, contentMode: .scaleAspectFill)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
