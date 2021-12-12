//
//  TableViewCell.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 25.09.2021.
//

import UIKit

class VotingCatCell: UITableViewCell {

    private var cat: Cat!
    
    @IBOutlet var fotoImage: UIImageView!
    @IBOutlet var checkBox: UIButton!
    @IBAction func changeState(_ sender: Any) {
        if !self.checkBox.isSelected {
            for cat in cats {
                cat.isSelected = false
            }
        }
        self.checkBox.isSelected.toggle()
        self.cat.isSelected.toggle()
        let tableView = superview as? UITableView
        tableView?.reloadData()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(cat: Cat){
        self.cat = cat
        self.fotoImage.image = self.cat.fotos[0]
        
        self.checkBox.setImage(UIImage(named: "checkBoxOn"), for: .selected)
        self.checkBox.setImage(UIImage(named: "checkBoxOff"), for: .normal)
        self.checkBox.isSelected = self.cat.isSelected
    }
}
