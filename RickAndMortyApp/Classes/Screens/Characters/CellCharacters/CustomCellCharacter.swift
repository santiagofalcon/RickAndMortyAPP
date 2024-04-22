//
//  CustomCellCharacter.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit

class CustomCellCharacter: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI() {
        // Cell style
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 0.8
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 4.0
        contentView.clipsToBounds = true

        // Photo style
        characterImage.layer.cornerRadius = characterImage.frame.size.width / 2.8
        characterImage.contentMode = .scaleAspectFill

        // Name style
        characterName.font = UIFont.boldSystemFont(ofSize: 16)
        characterName.textColor = .black
    }
}
