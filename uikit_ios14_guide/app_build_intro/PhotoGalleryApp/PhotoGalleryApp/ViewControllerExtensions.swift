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
        return self.fetchResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        if let asset = fetchResults?[indexPath.row] {
            cell.loadImage(asset: asset)
        }
        
        return cell
    }
    
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        let identifiers = results.map { $0.assetIdentifier ?? "" }

        fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)

        collectionView.reloadData()

        picker.dismiss(animated: true, completion: nil) //갤러리 화면 내리기

    }
    
}
