//
//  ViewController.swift
//  TesteJson
//
//  Created by admin on 30/08/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var noticias: Array<Noticia> = []
    var noticia: Noticia!
    var f = FeedNoticias()
    
    @IBAction func btReload(sender: AnyObject) {
        reload()
    }
    func reload(){
        noticias = f.getNoticias()
//        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        f.vc = self
        noticias = f.getNoticias()
//        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noticias.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celula", forIndexPath: indexPath) as! CelulaTableViewCell
        
        cell.vc = self
        cell.n = self.noticias[indexPath.row]
        cell.lbTitulo.text = cell.n.titulo
        cell.lbDate.text = cell.n.data
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    
    
    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            self.noticias.del(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        }
//    }
    
    // Override to support rearranging the table view.
//    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//        self.cadastro.swap(fromIndexPath.row, destino: toIndexPath.row)
//    }
//    
    
    
    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "abrir_noticia"){
            let clickNoticia = segue.destinationViewController as! AbrirViewController
            clickNoticia.vc = self
        }
    }


}

