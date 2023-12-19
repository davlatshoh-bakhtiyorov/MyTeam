//
//  TableViewCell.swift
//  Mening Jamoam
//
//  Created by Davlatshoh Baxtiyorov on 16/12/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNomi: UILabel!
    @IBOutlet weak var lblYoshi: UILabel!
    @IBOutlet weak var lblJoylashuvi: UILabel!
    @IBOutlet weak var lblDavlati: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
