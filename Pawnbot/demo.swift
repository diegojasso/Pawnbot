//
//  demo.swift
//  Pawnbot
//
//  Created by Diego Sánchez on 11/18/15.
//  Copyright © 2015 Pademobile. All rights reserved.
//

import UIKit

class demo: UITableViewController {
    
    @IBOutlet var ItemTableView: UITableView!
    
    var arrayofItems: [Producto] = [Producto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setItem()
    }
    
    func setItem()
    {
        let item1 = Producto(name: "Electrodomésticos", image: "Images/home.png", rango:"$400 - $500")
        let item2 = Producto(name: "Celulares", image:"Images/phone.png", rango:"$400 - $500")
        let item3 = Producto(name: "Computadoras", image:"Images/pc.png", rango:"$400 - $500")
        let item4 = Producto(name: "Joyas", image:"Images/jewel.png", rango:"$400 - $500")
        
        arrayofItems.append(item1)
        arrayofItems.append(item2)
        arrayofItems.append(item3)
        arrayofItems.append(item4)
    }
    
    func itemtableView(itemtableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofItems.count
    }
    
    func itemtableView(itemtableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let itemcell: PrendaListCell = itemtableView.dequeueReusableCellWithIdentifier("ItemCell") as! PrendaListCell
        
        let item = arrayofItems[indexPath.row]
        itemcell.setitemCell(item.name, itemImage: item.image,itemPrice: item.rango)
        
        return itemcell
        
    }

}
