//
// Created by 황병국 on 20/06/2017.
// Copyright (c) 2017 magi. All rights reserved.
//

import UIKit

public protocol MGGridViewDelegateFlowLayout: NSObjectProtocol {

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                sizeForItemAt indexPath: IndexPath) -> CGSize

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                insetForSectionAt section: Int) -> UIEdgeInsets

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                minimumLineSpacingForSectionAt section: Int) -> CGFloat

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                minimumInteritemSpacingForSectionAt section: Int) -> CGFloat

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                referenceSizeForHeaderInSection section: Int) -> CGSize

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                referenceSizeForFooterInSection section: Int) -> CGSize
}

extension MGGridViewDelegateFlowLayout {

  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                sizeForItemAt indexPath: IndexPath) -> CGSize {
    if let layout = gridViewLayout as? UICollectionViewFlowLayout {
      return layout.itemSize
    }

    return CGSize.zero
  }

  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                insetForSectionAt section: Int) -> UIEdgeInsets {
    if let layout = gridViewLayout as? UICollectionViewFlowLayout {
      return layout.sectionInset
    }

    return UIEdgeInsets.zero
  }

  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    if let layout = gridViewLayout as? UICollectionViewFlowLayout {
      return layout.minimumLineSpacing
    }

    return 0
  }

  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    if let layout = gridViewLayout as? UICollectionViewFlowLayout {
      return layout.minimumInteritemSpacing
    }

    return 0
  }

  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                referenceSizeForHeaderInSection section: Int) -> CGSize {
    if let layout = gridViewLayout as? UICollectionViewFlowLayout {
      return layout.headerReferenceSize
    }

    return CGSize.zero
  }

  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                referenceSizeForFooterInSection section: Int) -> CGSize {
    if let layout = gridViewLayout as? UICollectionViewFlowLayout {
      return layout.footerReferenceSize
    }

    return CGSize.zero
  }
}
