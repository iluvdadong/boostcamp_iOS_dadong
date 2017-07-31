//
//  PhotoViewController.swift
//  Phtorama
//
//  Created by dadong on 2017. 7. 31..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        store.fetchInterestingPhotos {
            (photosresult) -> Void in
            
            switch photosresult {
            case let .success(photos):
                print("성공적으로 찾음 \(photos.count) photos.")
                self.photoDataSource.photos = photos
            case let .failure(error):
                print("에러 패칭 인터레스팅 포토즈  : \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
    
        let photo = photoDataSource.photos[indexPath.row]
        
        //이미지 데이터 다운받는다 좀 시간 걸리는
        store.fetchImage(for: photo) { (result) -> Void in
        
            guard let photoIndex = self.photoDataSource.photos.index(of: photo),
                case let .success(image) = result else {
                    return
            }
            let photoIndexPath = IndexPath(item: photoIndex, section : 0)
            
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                cell.update(with: image)
            }
        
        }
    
    }
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
