//
//  ViewController.swift
//  FileManager
//
//  Created by Appnap WS09 on 8/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    var img: [UIImage] = [#imageLiteral(resourceName: "8d1d0e466916786c3c234a97edbe6057_0417d52fc16aaff68ffc6e5c0bce72e5"), #imageLiteral(resourceName: "Son_Goku_SSJ2"), #imageLiteral(resourceName: "goku-super-saiyan-blue-son-goku"), #imageLiteral(resourceName: "png-transparent-goku-vegeta-gohan-bulma-frieza-son-television-trunks-cartoon"), #imageLiteral(resourceName: "goku-vegeta-trunks-dragon-ball-gohan-evolution"), #imageLiteral(resourceName: "374-3747082_goku-clipart-son-dragon-ball-son-goku-kid"), #imageLiteral(resourceName: "Son_Goku_SSJ2")]
    var imgURLs = [URL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .yellow
        anotherSandBox()
    }
    
    func sandBox() {
        let folderName = "MyFolder"
        let fM = FileManager.default
        let docURL = try! fM.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myFolder = docURL.appendingPathComponent(folderName)
        try! fM.createDirectory(at: myFolder, withIntermediateDirectories: true)
        
        print(myFolder.path)
    }
    
    //creating directries
    func newSandBox() {
        let folderName = "Goku Collection"
        let folderURL = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(folderName)
        try! FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
        
        print(folderURL.path)
        
        for (indx, img) in img.enumerated() {
            if let imgData = img.jpegData(compressionQuality: 1.0) {
                let imgURL = folderURL.appendingPathComponent("img\(indx)").appendingPathExtension("jpg")
                
                do {
                    try imgData.write(to: imgURL)
                    //self.imgURLs.append(imgURL)
                }
                catch let err {
                    print(err.localizedDescription)
                }
            }
        }
    }
    
    func anotherSandBox() {
        let folderName = "Image Collection"
        let folderURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(folderName)
        //try! FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
        
        print(folderURL.path as Any)
        
        for (i, images) in img.enumerated(){
            if let imagData = images.jpegData(compressionQuality: 1.0) {
                //setting IMAGE URL PATH with it's extention
                let imgURL = folderURL.appendingPathComponent("image Number \(i)").appendingPathExtension("jpg")
                
                do{
                    try imagData.write(to: imgURL)
                    //MARK:- STORE OR APPANDE IMAGES HERE FOR REUSE
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    //MARK:- RETRIVE THE ONE IMAGE TO DISPLAY IT ON A IMAGEVIEW
    
}

