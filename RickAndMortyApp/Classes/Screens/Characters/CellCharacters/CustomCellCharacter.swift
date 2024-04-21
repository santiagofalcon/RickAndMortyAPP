//
//  CustomCellCharacter.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit

class CustomCellCharacter: UITableViewCell {
    
    @IBOutlet weak var characterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
