//
//  ViewControllerExtensions.swift
//  PhotoGalleryApp
//
//  Created by Chu Yu Min on 2022/02/02.
//

import UIKit
import PhotosUI

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        return cell
    }
    
    
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
//        results.map{ $0.assetIdentifier }
        let identifiers = results.map {
            $0.assetIdentifier ?? ""
        }
        
        let fetchAssets = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        
        
//        fetchAssets.enumerateObjects { asset, index, stop in //fethAsset에서 이미지를 가져옴
//
//            let imageManager = PHImageManager() //image로 바꿔서 가져옴
//
//            let scale = UIScreen.main.scale
//            let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
//
//            imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: nil) { image, info in
//                self.images.append(image)
//            }
//
//        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
