//
//  ViewController.swift
//  CustomSegue
//
//  Created by Ju on 2017/6/4.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}

// MARK: - View controller
class ViewController: UIViewController {

    private let cellHeight : CGFloat = 200
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.bounds.width, height: cellHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContentDetail" {
            let desvc = segue.destination as! DetailViewController
            let indexPath = collectionView.indexPathsForSelectedItems![0]
            desvc.image = UIImage(named: "\(10 + indexPath.item)")
        }
    }
    
    @IBAction func unwindToViewController(_ segue: UIStoryboardSegue) {
    }
}


// MARK: - Collection view datasource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let cell = cell as? ContentCell {
            cell.imageView.image = UIImage(named: "\(10 + indexPath.item)")
        }
        
        return cell
    }
}

// MARK: - ViewHeadabel protocol

extension ViewController: ViewHeadabel {
    
    var animatedViewFrame: CGRect {
        let attribute = collectionView.layoutAttributesForItem(at: collectionView.indexPathsForSelectedItems![0])
        let cellRect = attribute?.frame
        let animatedFrame = collectionView?.convert((cellRect)!, to: collectionView.superview)
        
        return animatedFrame!
    }
    
    
}

