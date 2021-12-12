//
//  NameCatCell.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 01.10.2021.
//

import UIKit

class NameCatCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(cat: Cat) {
        nameLabel.text = cat.firstName + " " + cat.patronymic + " " + cat.lastName
        nameLabel.textAlignment = .center
    }
}
