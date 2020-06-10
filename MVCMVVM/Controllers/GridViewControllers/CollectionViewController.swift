//
//  CollectionViewController.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController  {

    @IBOutlet weak var collectionView: UICollectionView!
    var collectionData = [Image]()
    var selectedImage:Image!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let width = self.view.frame.width/3 - 10
        let collectionLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionLayout.itemSize = CGSize(width: width, height: width)
        
        getImages {[weak self] (images) in
            self?.collectionData = images
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? FullSizeImageViewController {
            destinationViewController.image = selectedImage
            // send the picture data for the new vc
            
        }
    }

}

extension CollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.setImage(collectionData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage = collectionData[indexPath.row]
        performSegue(withIdentifier: "toFullSizeImage", sender: nil)
    }
}
