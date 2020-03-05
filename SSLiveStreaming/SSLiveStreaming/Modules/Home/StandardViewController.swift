//
//  StandardViewController.swift
//  SSLiveStreaming
//
//  Created by Selina on 2020/3/5.
//  Copyright © 2020 Selina. All rights reserved.
//

import UIKit
import JXPagingView
import JXCategoryView

class StandardViewController: UIViewController {
    public var listViewDidScrollCallback: ((UIScrollView) -> ())?
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flow: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: 210, height: 260)
        flow.minimumLineSpacing = 10
        flow.minimumInteritemSpacing = 10
        flow.scrollDirection = .horizontal
        return flow
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.contentInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = DDCColor.colorWithHex(RGB: 0xFFFFFF)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
}

extension StandardViewController: JXPagingViewListViewDelegate {
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        listViewDidScrollCallback = callback
    }


    func listView() -> UIView {
        return self.view
    }

    func listScrollView() -> UIScrollView {
        return self.collectionView
    }
}

extension StandardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
    }
}


