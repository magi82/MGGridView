//
//  MGGridView+DataSource.swift
//  collectionviewInTableViewTest
//
//  Created by ByungKook Hwang on 21/06/2017.
//  Copyright © 2017 magi. All rights reserved.
//

import UIKit

public protocol MGGridDataSource: NSObjectProtocol {
  
  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, numberOfItemsInSection section: Int) -> Int
  
  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
  
  @available(iOS 6.0, *)
  func numberOfSectionsFromGridView(in collectionView: UICollectionView) -> Int
  
  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                viewForSupplementaryElementOfKind kind: String,
                at indexPath: IndexPath) -> UICollectionReusableView
  
  @available(iOS 9.0, *)
  func gridView(_ gridView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool
  
  @available(iOS 9.0, *)
  func gridView(_ gridView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
}

extension MGGridDataSource {
  
  @available(iOS 6.0, *)
  public func numberOfSectionsFromGridView(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                viewForSupplementaryElementOfKind kind: String,
                at indexPath: IndexPath) -> UICollectionReusableView {
    gridView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: "empty")
    let cell = gridView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "empty", for: indexPath)
    return cell
  }
  
  @available(iOS 9.0, *)
  public func gridView(_ gridView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
    return false
  }
  
  @available(iOS 9.0, *)
  public func gridView(_ gridView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {}
}
