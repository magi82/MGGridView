// The MIT License (MIT)
//
// Copyright (c) 2017 ByungKook Hwang (https://magi82.github.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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
