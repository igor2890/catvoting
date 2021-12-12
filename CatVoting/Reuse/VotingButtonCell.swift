//
//  VotingButtonCell.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 25.09.2021.
//

import UIKit

class VotingButtonCell: UITableViewCell {

    weak var delegate: ButtonDelegate?
    
    
    @IBAction func makeVote(_ sender: UIButton) {
        onButtonTap(sender: sender)
    }
    
    func onButtonTap(sender: UIButton) {
        delegate?.onButtonTap(sender: sender)
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
