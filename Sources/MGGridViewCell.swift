//
//  MGGridViewCell.swift
//  collectionviewInTableViewTest
//
//  Created by 황병국 on 16/06/2017.
//  Copyright © 2017 magi. All rights reserved.
//

import UIKit

public class MGGridViewCell: UICollectionViewCell {
  
  private var collectionView: UICollectionView? = nil

  public func configure(_ block: (UICollectionView, UICollectionViewFlowLayout) -> Void) {
    guard collectionView == nil else { return }

    let size = CGRect(origin: .zero, size: self.contentView.bounds.size)
    let layout = UICollectionViewFlowLayout()
    collectionView = UICollectionView(frame: size, collectionViewLayout: layout)
    if let view = collectionView {
      block(view, layout)
      self.contentView.addSubview(view)
    }
  }

  public func setCollectionViewDataSourceDelegate(delegate: UICollectionViewDelegate,
                                                  dataSource: UICollectionViewDataSource,
                                                  forRow row: Int) {
    if let view = collectionView {
      view.delegate = delegate
      view.dataSource = dataSource
      view.tag = row
      view.setContentOffset(view.contentOffset, animated:false)
      view.reloadData()
    }
  }

  public var collectionViewOffset: CGFloat {
    get {
      guard let view = collectionView else { return 0 }
      return view.contentOffset.x
    }
    set {
      collectionView?.contentOffset.x = newValue
    }
  }
  
}
