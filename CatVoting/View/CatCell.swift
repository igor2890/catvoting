//
//  CatCell.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 24.09.2021.
//

import UIKit

class CatCell: UITableViewCell {

    @IBOutlet var catFoto: UIImageView!
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
        
        self.catFoto.image = cat.fotos[0] ?? UIImage(named: "default")
        self.nameLabel.text = cat.firstName + " " + cat.patronymic + " " + cat.lastName
    }
    
}
