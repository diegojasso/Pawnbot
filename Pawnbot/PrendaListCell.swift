//
//  PrendaListCell.swift
//  Pawnbot
//
//  Created by Diego Sánchez on 11/18/15.
//  Copyright © 2015 Pademobile. All rights reserved.
//

import UIKit

class PrendaListCell: UITableViewCell {

    @IBOutlet weak var ListItemImage: UIImageView!
    @IBOutlet weak var ListItemName: UILabel!
    @IBOutlet weak var ListItemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setitemCell(itemName: String, itemImage: String, itemPrice: String)
    {
        self.ListItemImage.image = UIImage(named: itemImage)
        self.ListItemName.text = itemName
        self.ListItemPrice.text = itemPrice
    }
}
