//
//  AbrirViewController.swift
//  iNews
//
//  Created by Júnior Palitot on 02/09/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class AbrirViewController: UIViewController {
    
    var vc:ViewController!
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbDescri: UITextView!
    
    override func viewDidLoad() {
        lbTitulo.text = vc.noticia?.titulo
        lbDate.text = vc.noticia?.data
        lbDescri.text = vc.noticia?.snippet
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Abrir", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(abrirNavegador))
    }
    
    func abrirNavegador() {
        UIApplication.sharedApplication().openURL(NSURL(string: vc.noticia.link)!)
    }
}
