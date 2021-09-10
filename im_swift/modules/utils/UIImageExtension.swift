//
//  UIImageExtension.swift
//  coinandcoin
//
//  Created by yinghu on 2020/4/20.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

public extension UIImage {
    /****倒三角****/
    func triangleImageWithSize(size: CGSize , tintColor : UIColor) -> UIImage{
           UIGraphicsBeginImageContextWithOptions(size, false, 0)
           let ctx = UIGraphicsGetCurrentContext()
           let path = UIBezierPath.init()
           path.move(to: CGPoint.init(x: 0, y: 0))
           path.addLine(to: CGPoint.init(x: size.width / 2, y: size.height))
           path.addLine(to: CGPoint.init(x: size.width, y: 0))
           path.close()
        
//           CGContext.setFillColor(ctx)
//        CG
           path.fill()
        guard let resultImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage()}
        UIGraphicsEndImageContext()
        return resultImage
       }
    
    
    func compressImageMid(maxLength: Int) -> Data? {
      var compression: CGFloat = 1
        guard var data = self.jpegData(compressionQuality: 1) else { return nil }

      if data.count < maxLength {
          return data
      }
      print("压缩前kb", data.count / 1024, "KB")
      var max: CGFloat = 1
      var min: CGFloat = 0
      for _ in 0..<6 {
          compression = (max + min) / 2
        data = self.jpegData(compressionQuality: compression)!
          if CGFloat(data.count) < CGFloat(maxLength) * 0.9 {
              min = compression
          } else if data.count > maxLength {
              max = compression
          } else {
              break
          }
      }
      var resultImage: UIImage = UIImage(data: data)!
      if data.count < maxLength {
          return data
      }
        return data
    }
    

    public func imageWithNewSize(size: CGSize) -> UIImage? {
        
        if self.size.height > size.height {
            
            let width = size.height / self.size.height * self.size.width
            
            let newImgSize = CGSize(width: width, height: size.height)
            
            UIGraphicsBeginImageContext(newImgSize)
            
            self.draw(in: CGRect(x: 0, y: 0, width: newImgSize.width, height: newImgSize.height))
            
            let theImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            guard let newImg = theImage else { return  nil}
            
            return newImg
            
        } else {
            
            let newImgSize = CGSize(width: size.width, height: size.height)
            
            UIGraphicsBeginImageContext(newImgSize)
            
            self.draw(in: CGRect(x: 0, y: 0, width: newImgSize.width, height: newImgSize.height))
            
            let theImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            guard let newImg = theImage else { return  nil}
            
            return newImg
        }
        
    }
    
    
    func compressImageOnlength(maxLength: Int) -> Data? {
        
        guard let vData = self.jpegData(compressionQuality: 1) else { return nil }
        
        if vData.count < maxLength {
            return vData
        }
        var compress:CGFloat = 0.9
        guard var data = self.jpegData(compressionQuality: compress) else { return nil }
        while data.count > maxLength && compress > 0.01 {
            
            compress -= 0.02
            data = self.jpegData(compressionQuality: compress)!
        }
        
        return data
    }
}




