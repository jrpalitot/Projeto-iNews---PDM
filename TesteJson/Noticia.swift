//
//  Noticia.swift
//  TesteJson
//
//  Created by Júnior Palitot on 02/09/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class Noticia: NSObject {
    var titulo: String!
    var link: String!
    var autor: String!
    var data: String!
    var snippet: String!
    var previa: String!
    
    override var description: String{
        return self.titulo
    }
    
    init(titulo: String, link: String, autor: String, data: String, snippet: String, previa: String) {
        self.titulo = titulo
        self.link = link
        self.autor = autor
        self.data = data
        self.snippet = snippet
        self.previa = previa
    }
}