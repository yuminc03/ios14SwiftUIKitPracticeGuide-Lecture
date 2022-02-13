//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by Chu Yu Min on 2022/02/02.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var fetchResults: PHFetchResult<PHAsset>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setLayout()
    }
    
    private func setView() {
        self.title = "Photo"
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(checkPermission))
        photoItem.tintColor = .systemGray
        self.navigationItem.rightBarButtonItem = photoItem
        
        let reloadItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(reloadItemDidTapped))
        reloadItem.tintColor = .systemGray
        self.navigationItem.leftBarButtonItem = reloadItem
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 1, height: 200)
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        collectionView.collectionViewLayout = layout
    }
    
    @objc private func checkPermission() {
        if PHPhotoLibrary.authorizationStatus() == .authorized || PHPhotoLibrary.authorizationStatus() == .limited {
            DispatchQueue.main.async {
                self.photoItemDidTapped()
            }
            
        }
        else if PHPhotoLibrary.authorizationStatus() == .denied {
            DispatchQueue.main.async {
                self.presentAuthorizationAlert(title: "포토라이브러리 접근 권한을 활성화 해주세요.", message: nil)
            }
            
        }
        else if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization { status in
                self.checkPermission()
            }
        }
    }
    
    func presentAuthorizationAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: { action in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            
        }))
        self.present(alert, animated: true, completion: nil)
    }

    @objc func photoItemDidTapped() { //갤러리 보여줌
        let library = PHPhotoLibrary.shared() //singleton 형태
        
        var configuration = PHPickerConfiguration(photoLibrary: library)
        configuration.selectionLimit = 10
        configuration.filter = PHPickerFilter.images
        
        let picker = PHPickerViewController(configuration: configuration) //framework에서 제공하는 gallery 모양 띄움
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
    }
    
    @objc func reloadItemDidTapped() { //사진 데이터 다시 불러옴
        collectionView.reloadData()
    }
}

