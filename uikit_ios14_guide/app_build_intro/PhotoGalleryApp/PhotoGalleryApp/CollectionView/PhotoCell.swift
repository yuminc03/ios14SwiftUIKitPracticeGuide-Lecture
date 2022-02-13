//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by Chu Yu Min on 2022/02/02.
//

import UIKit
import PhotosUI

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill
        }
    }
    
    func loadImage(asset: PHAsset) {
        
        let imageManager = PHImageManager() //image로 바꿔서 가져옴
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .opportunistic
        
        photoImageView.image = nil
        
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options) { image, info in
//            if (info?[PHImageResultIsDegradedKey] as? Bool) == true {
//                //저화질
//                self.photoImageView.image = image
//            }
//            else {
//                //고화질
//
//            }
            self.photoImageView.image = image
        }
    }
    
    
}
