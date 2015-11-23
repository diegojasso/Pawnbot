//
//  ViewController.swift
//  Pawnbot
//
//  Created by Diego Sánchez on 11/17/15.
//  Copyright © 2015 Pademobile. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet var CatalogTableView: UITableView!
//    @IBOutlet var ItemTableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var KilatajeButton: UIButton!
    
    var newMedia: Bool?
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
    
    @IBAction func useCamera(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.Camera) {
                
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.Camera
                imagePicker.mediaTypes = [kUTTypeImage as String]
                imagePicker.allowsEditing = false
                
                self.presentViewController(imagePicker, animated: true, 
                    completion: nil)
                newMedia = true
        }
    }
    
    @IBAction func useCameraRoll(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.PhotoLibrary
                imagePicker.mediaTypes = [kUTTypeImage as String]
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newMedia = false
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        if mediaType == kUTTypeImage as String {
            let image = info[UIImagePickerControllerOriginalImage]
                as! UIImage
            
            imageView.image = image
            
            if (newMedia == true) {
                UIImageWriteToSavedPhotosAlbum(image, self,
                    "image:didFinishSavingWithError:contextInfo:", nil)
            } else if mediaType == kUTTypeImage as String {
                // Code to support video here
            }
            
        }
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafePointer<Void>) {
        
        if error != nil {
            let alert = UIAlertController(title: "Save Failed",
                message: "Failed to save image",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                style: .Cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true,
                completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func showAlertWasTapped(sender: UIButton) {
        
        let alertController = UIAlertController(title: "Tipo", message: "Elige la categoría de tu producto", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let okAction = UIAlertAction(title: "Celulares", style: UIAlertActionStyle.Default, handler: {(alert :UIAlertAction) in
            self.KilatajeButton.setTitle("Celular", forState: .Normal)

            print("OK button tapped")
        })
        alertController.addAction(okAction)
        
        let dosAction = UIAlertAction(title: "Tablet digital", style: UIAlertActionStyle.Default, handler: {(alert :UIAlertAction) in
            self.KilatajeButton.setTitle("Tablet", forState: .Normal)

            print("OK button tapped")
        })
        alertController.addAction(dosAction)
        
        let deleteAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive, handler: {(alert :UIAlertAction) in
            self.KilatajeButton.setTitle("Tipo", forState: .Normal)

            print("Delete button tapped")
        })
        alertController.addAction(deleteAction)
        
        alertController.popoverPresentationController?.sourceView = view
        alertController.popoverPresentationController?.sourceRect = sender.frame
        
        presentViewController(alertController, animated: true, completion: nil)
        
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
    

    
}

