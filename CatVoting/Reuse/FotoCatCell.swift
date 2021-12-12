//
//  FotoCatCell.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 01.10.2021.
//

import UIKit

class FotoCatCell: UITableViewCell {

    @IBOutlet var fotoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(cat: Cat) {
        fotoImage.image = cat.fotos[0]
    }
    
}
