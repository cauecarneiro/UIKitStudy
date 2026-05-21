//
//  ContatoCell.swift
//  StoryboardEstudoDeCaso
//
//  Created by Joao pedro Leonel on 18/05/26.
//

import UIKit

class ContatoCell: UITableViewCell {
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var mensagemLabel: UILabel!
    @IBOutlet weak var horarioLabel: UILabel!
    @IBOutlet weak var badgeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fotoImageView.layer.cornerRadius = 25
        fotoImageView.clipsToBounds = true
    }
}


