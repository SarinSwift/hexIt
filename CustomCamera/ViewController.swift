//
//  ViewController.swift
//  CustomCamera
//
//  Created by Sarin Swift on 11/3/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var myImg: UIImageView!
    var imageForData: UIImage?
    var colorNumber: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func takePhotoTapped(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImg.contentMode = .scaleToFill
            myImg.image = pickedImage
            imageForData = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
        colorNumber = getImageHex()
        if labelOne != nil {
            labelOne.isHidden = false
            labelOne.text = colorNumber
        } else {
            print("returned nil")
            labelOne.isHidden = false
        }
        
    }
    func getImageHex() -> String {
        let heightInPoints = imageForData!.size.height
        let widthInPoints = imageForData!.size.width
        let picColor = imageForData!.getPixelColor(pos: CGPoint(x: (widthInPoints/2), y: (widthInPoints/2)))
        let picColorHex = picColor.toHexString
        print(picColorHex)
        
        return picColorHex
    }
}
extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}
extension UIColor {
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
