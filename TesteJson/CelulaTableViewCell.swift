//
//  CelulaTableViewCell.swift
//  iNews
//
//  Created by Júnior Palitot on 02/09/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class CelulaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    var n:Noticia!
    var vc:ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbTitulo.numberOfLines = 0
        lbTitulo.sizeToFit()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if (selected == true){
            print(self.n.titulo)
            vc.noticia = self.n
        }
    }
    
}
