//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by Chu Yu Min on 2022/02/02.
//

import UIKit
import Photos

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadImage(asset: PHAsset) {
        
        let imageManager = PHImageManager() //image로 바꿔서 가져옴
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)

        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: nil) { image, info in
            self.photoImageView.image = image
        }
    }
    
    
}
