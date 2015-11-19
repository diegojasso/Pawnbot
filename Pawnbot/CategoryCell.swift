//
//  CategoryCell.swift
//  Pawnbot
//
//  Created by Diego Sánchez on 11/17/15.
//  Copyright © 2015 Pademobile. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var PrendaImage: UIImageView!
    @IBOutlet weak var PrendaName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(prendaNameText: String, prendaImageURL: String)
    {
        self.PrendaImage.image = UIImage(named: prendaImageURL)
        self.PrendaName.text = prendaNameText
    }

}
