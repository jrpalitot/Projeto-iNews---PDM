//
//  FeedNoticias.swift
//  iNews
//
//  Created by Júnior Palitot on 02/09/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
import UIKit

class FeedNoticias: NSObject {
    var vc:ViewController!
    var noticias = Array<Noticia>()
    
    func getNoticias() -> Array<Noticia>{
        self.noticias = []
        let requestURL: NSURL = NSURL(string: "https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&q=http://g1.globo.com/dynamo/planeta-bizarro/rss2.xml")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Tudo certo, json baixado com sucesso.")
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    let noticiasJson = json["responseData"]!!["feed"]!!["entries"]! as! [[String: AnyObject]]
                    var noticia: Noticia!
                    for noticiaJson in noticiasJson{
                        noticia = Noticia(titulo: (noticiaJson["title"] as! String), link: (noticiaJson["link"] as! String), autor: (noticiaJson["author"] as! String), data:   (noticiaJson["publishedDate"] as! String), snippet: (noticiaJson["contentSnippet"] as! String), previa: (noticiaJson["content"] as! String))
                        self.noticias.append(noticia)
                    }
                    self.vc.noticias = self.noticias
                    self.vc.tableView.reloadData()
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        let requestURL2: NSURL = NSURL(string: "https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&q=http://entretenimento.r7.com/pop/jovem/feed.xml")!
        let urlRequest2: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL2)
        let session2 = NSURLSession.sharedSession()
        let task2 = session2.dataTaskWithRequest(urlRequest2) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Tudo certo, json baixado com sucesso.")
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    let noticiasJson = json["responseData"]!!["feed"]!!["entries"]! as! [[String: AnyObject]]
                    var noticia: Noticia!
                    for noticiaJson in noticiasJson{
                        noticia = Noticia(titulo: (noticiaJson["title"] as! String), link: (noticiaJson["link"] as! String), autor: (noticiaJson["author"] as! String), data:   (noticiaJson["publishedDate"] as! String), snippet: (noticiaJson["contentSnippet"] as! String), previa: (noticiaJson["content"] as! String))
                        self.noticias.append(noticia)
                    }
                    self.vc.noticias = self.noticias
                    self.vc.tableView.reloadData()
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        task.resume()
        task2.resume()
        
        return self.noticias
    }
    
}