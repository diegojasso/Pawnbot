//
//  ViewController.swift
//  Pawnbot
//
//  Created by Diego Sánchez on 11/17/15.
//  Copyright © 2015 Pademobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet var CatalogTableView: UITableView!
//    @IBOutlet var ItemTableView: UITableView!
    
    var arrayofPrendas: [Prenda] = [Prenda]()
    var arrayofItems: [Producto] = [Producto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setPrenda()
//        self.setItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setPrenda()
    {
        let prenda1 = Prenda(name: "Electrodomésticos", image: "Images/home.png")
        let prenda2 = Prenda(name: "Celulares", image:"Images/phone.png")
        let prenda3 = Prenda(name: "Computadoras", image:"Images/pc.png")
        let prenda4 = Prenda(name: "Joyas", image:"Images/jewel.png")
        
        arrayofPrendas.append(prenda1)
        arrayofPrendas.append(prenda2)
        arrayofPrendas.append(prenda3)
        arrayofPrendas.append(prenda4)

    }
    
    
//    func setItem()
//    {
//        let item1 = Producto(name: "Electrodomésticos", image: "Images/home.png", rango:"$400 - $500")
//        let item2 = Producto(name: "Celulares", image:"Images/phone.png", rango:"$400 - $500")
//        let item3 = Producto(name: "Computadoras", image:"Images/pc.png", rango:"$400 - $500")
//        let item4 = Producto(name: "Joyas", image:"Images/jewel.png", rango:"$400 - $500")
//        
//        arrayofItems.append(item1)
//        arrayofItems.append(item2)
//        arrayofItems.append(item3)
//        arrayofItems.append(item4)
//    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofPrendas.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell: CategoryCell = tableView.dequeueReusableCellWithIdentifier("CategoryItem") as! CategoryCell
         
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        
        let prenda = arrayofPrendas[indexPath.row]
        
        cell.setCell(prenda.name, prendaImageURL: prenda.image)
        
        return cell
    
    }
    
//    func itemtableView(itemtableView: UITableView!, numberOfRowsInSection section: Int) -> Int
//    {
//        return arrayofItems.count
//    }
//    
//    func itemtableView(itemtableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
//    {
//        let itemcell: PrendaListCell = itemtableView.dequeueReusableCellWithIdentifier("ItemCell") as! PrendaListCell
//
//        let item = arrayofItems[indexPath.row]
//        itemcell.setitemCell(item.name, itemImage: item.image,itemPrice: item.rango)
//        
//        return itemcell
//        
//    }
    
}

