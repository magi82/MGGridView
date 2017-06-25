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

public class MGGridView: UICollectionView {

  fileprivate weak var ownerDelegate: UICollectionViewDelegate? = nil
  fileprivate weak var ownerDataSource: UICollectionViewDataSource? = nil
  fileprivate weak var gridDelegate: MGGridViewDelegate? = nil
  fileprivate weak var gridDataSource: MGGridViewDataSource? = nil
  fileprivate weak var gridDelegateFlowLayout: MGGridViewDelegateFlowLayout? = nil

  var storedOffsets = [Int: CGFloat]()

  override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  public func configure<D: UICollectionViewDelegate
                    & UICollectionViewDataSource
                    & MGGridViewDelegate
                    & MGGridViewDataSource>(delegate: D) {
    self.delegate = self
    self.dataSource = self

    ownerDelegate = delegate
    ownerDataSource = delegate
    gridDelegate = delegate
    gridDataSource = delegate
  }

  public func configure<D: UICollectionViewDelegate
                    & UICollectionViewDataSource
                    & MGGridViewDelegate
                    & MGGridViewDataSource
                    & MGGridViewDelegateFlowLayout>(delegate: D) {
    self.delegate = self
    self.dataSource = self

    ownerDelegate = delegate
    ownerDataSource = delegate
    gridDelegate = delegate
    gridDataSource = delegate
    gridDelegateFlowLayout = delegate
  }
}

extension MGGridView: UICollectionViewDataSource {

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return gridDataSource?.gridView(collectionView, numberOfItemsInSection: section) ?? 0
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    guard let cell = gridDataSource?.gridView(collectionView, cellForItemAt: indexPath) else {
      collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "empty")
      let emptyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "empty", for: indexPath)
      return emptyCell
    }

    return cell
  }

  @available(iOS 6.0, *)
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return gridDataSource?.numberOfSectionsFromGridView(in: collectionView) ?? 1
  }

  public func collectionView(_ collectionView: UICollectionView,
                             viewForSupplementaryElementOfKind kind: String,
                             at indexPath: IndexPath) -> UICollectionReusableView {

    guard let view = gridDataSource?.gridView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath) else {
      collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: "empty")
      let emptyView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "empty", for: indexPath)
      return emptyView
    }

    return view
  }

  @available(iOS 9.0, *)
  public func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
    return gridDataSource?.gridView(collectionView, canMoveItemAt: indexPath) ?? false
  }

  @available(iOS 9.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                      moveItemAt sourceIndexPath: IndexPath,
                      to destinationIndexPath: IndexPath) {
    gridDataSource?.gridView(collectionView, moveItemAt: sourceIndexPath, to: destinationIndexPath)
  }
}

extension MGGridView: UICollectionViewDelegate {

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    if let delegate = gridDelegate {
      return delegate.gridView(collectionView, shouldHighlightItemAt: indexPath)
    }

    return true
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    gridDelegate?.gridView(collectionView, didHighlightItemAt: indexPath)
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    gridDelegate?.gridView(collectionView, didUnhighlightItemAt: indexPath)
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    if let delegate = gridDelegate {
      return delegate.gridView(collectionView, shouldSelectItemAt: indexPath)
    }

    return true
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
    if let delegate = gridDelegate {
      return delegate.gridView(collectionView, shouldDeselectItemAt: indexPath)
    }

    return true
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    gridDelegate?.gridView(collectionView, didSelectItemAt: indexPath)
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    gridDelegate?.gridView(collectionView, didDeselectItemAt: indexPath)
  }

  @available(iOS 8.0, *)
  public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard let tableViewCell = cell as? MGGridViewCell else { return }

    if let delegate = ownerDelegate, let dataSource = ownerDataSource {
      tableViewCell.setCollectionViewDataSourceDelegate(delegate: delegate,
        dataSource: dataSource,
        forRow: indexPath.row)
    }
    tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    gridDelegate?.gridView(collectionView, willDisplay: cell, forItemAt: indexPath)
  }

  @available(iOS 8.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                willDisplaySupplementaryView view: UICollectionReusableView,
                forElementKind elementKind: String,
                at indexPath: IndexPath) {
    gridDelegate?.gridView(collectionView,
      willDisplaySupplementaryView: view,
      forElementKind: elementKind,
      at: indexPath)
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                      didEndDisplaying cell: UICollectionViewCell,
                      forItemAt indexPath: IndexPath) {
    guard let tableViewCell = cell as? MGGridViewCell else { return }

    storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset

    gridDelegate?.gridView(collectionView, didEndDisplaying: cell, forItemAt: indexPath)
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                didEndDisplayingSupplementaryView view: UICollectionReusableView,
                forElementOfKind elementKind: String,
                at indexPath: IndexPath) {
    gridDelegate?.gridView(collectionView,
      didEndDisplayingSupplementaryView: view,
      forElementOfKind: elementKind,
      at: indexPath)
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
    if let delegate = gridDelegate {
      return delegate.gridView(collectionView, shouldShowMenuForItemAt: indexPath)
    }

    return false
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                canPerformAction action: Selector,
                forItemAt indexPath: IndexPath,
                withSender sender: Any?) -> Bool {
    if let delegate = gridDelegate {
      return delegate.gridView(collectionView, canPerformAction: action, forItemAt: indexPath, withSender: sender)
    }

    return false
  }

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                performAction action: Selector,
                forItemAt indexPath: IndexPath,
                withSender sender: Any?) {
    gridDelegate?.gridView(collectionView, performAction: action, forItemAt: indexPath, withSender: sender)
  }

  @available(iOS 7.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
    if let delegate = gridDelegate {
      return delegate.gridView(collectionView, transitionLayoutForOldLayout: fromLayout, newLayout: toLayout)
    }

    return UICollectionViewTransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
  }

  @available(iOS 9.0, *)
  public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
    if let delegate = gridDelegate {
      return delegate.gridView(collectionView, canFocusItemAt: indexPath)
    }

    return collectionView.allowsSelection
  }

  @available(iOS 9.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
    if let delegate = gridDelegate {
      return delegate.gridView(collectionView, shouldUpdateFocusIn: context)
    }

    return true
  }

  @available(iOS 9.0, *)
  public func collectionView(_ collectionView: UICollectionView,
                didUpdateFocusIn context: UICollectionViewFocusUpdateContext,
                with coordinator: UIFocusAnimationCoordinator) {
    gridDelegate?.gridView(collectionView, didUpdateFocusIn: context, with: coordinator)
  }
}

extension MGGridView: UICollectionViewDelegateFlowLayout {
  public func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    if let gridLayout = gridDelegateFlowLayout {
      return gridLayout.gridView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }

    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      return layout.itemSize
    }

    return CGSize.zero
  }

  public func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    if let gridLayout = gridDelegateFlowLayout {
      return gridLayout.gridView(collectionView, layout: collectionViewLayout, insetForSectionAt: section)
    }

    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      return layout.sectionInset
    }

    return UIEdgeInsets.zero
  }

  public func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    if let gridLayout = gridDelegateFlowLayout {
      return gridLayout.gridView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: section)
    }

    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      return layout.minimumLineSpacing
    }

    return 0
  }

  public func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    if let gridLayout = gridDelegateFlowLayout {
      return gridLayout.gridView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section)
    }

    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      return layout.minimumInteritemSpacing
    }

    return 0
  }

  public func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      referenceSizeForHeaderInSection section: Int) -> CGSize {
    if let gridLayout = gridDelegateFlowLayout {
      return gridLayout.gridView(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection: section)
    }

    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      return layout.headerReferenceSize
    }

    return CGSize.zero
  }

  public func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      referenceSizeForFooterInSection section: Int) -> CGSize {
    if let gridLayout = gridDelegateFlowLayout {
      return gridLayout.gridView(collectionView, layout: collectionViewLayout, referenceSizeForFooterInSection: section)
    }

    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      return layout.footerReferenceSize
    }

    return CGSize.zero
  }
}
