//
//  ViewController.swift
//  RGBtoHexConventer
//
//  Created by zeytun on 13.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    var secilenIndex : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        secilenIndex = sender.selectedSegmentIndex
        
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtBlue.text?.removeAll()
        txtGreen.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        
        if secilenIndex == 0 {
            btnConvert.setTitle("RGB - HEX ÇEVİR", for: UIControl.State.normal)
        }else{
            btnConvert.setTitle("HEX - RGB ÇEVİR", for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        if secilenIndex == 0{
            
            convertRGBtoHEX()
            
        }else{
            
            convertHEXtoRGB()
        }
        
    }
    
    func convertRGBtoHEX(){
        
        
       /* guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}
       */
        // if let yerine guard let i bu şekilde kullanabilirsin.Guard let de son olarak verdiğimiz komut çalışmazsa else kısmı
        // return ile boş eleman döndürür
        
        if let redValue = UInt8(txtRed.text!){
            
            if let greenValue = UInt8(txtGreen.text!){
                
                if let blueValue = UInt8(txtBlue.text!){
                    
                    // buraya kadar doğru bir şekilde gelindiyse kullanıcı girilmesi gereken değerleri doğru bir şekilde girmiştir.
                    
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    
                    lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                    
                    
                    
                }
            }
        }
        
    }
    
    func convertHEXtoRGB(){
        
        if let redValue = UInt8(txtRed.text! , radix : 16){
            
            if let greenValue = UInt8(txtGreen.text! , radix : 16){
                
                if let blueValue = UInt8(txtBlue.text! , radix: 16){
                    
                    // radix : 16 değeri hexadecimial değerini temsil ediyor.
                    
                    lblResult.text = "RED :\(redValue) \n Green : \(greenValue) \n Blue :\(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
        
    }
}

