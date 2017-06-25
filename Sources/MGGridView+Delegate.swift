//
// Created by 황병국 on 20/06/2017.
// Copyright (c) 2017 magi. All rights reserved.
//

import UIKit

public protocol MGGridDelegate: NSObjectProtocol {

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, didHighlightItemAt indexPath: IndexPath)

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath)

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, didSelectItemAt indexPath: IndexPath)

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, didDeselectItemAt indexPath: IndexPath)

  @available(iOS 8.0, *)
  func gridView(_ gridView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)

  @available(iOS 8.0, *)
  func gridView(_ gridView: UICollectionView,
                willDisplaySupplementaryView view: UICollectionReusableView,
                forElementKind elementKind: String,
                at indexPath: IndexPath)

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                didEndDisplaying cell: UICollectionViewCell,
                forItemAt indexPath: IndexPath)

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                didEndDisplayingSupplementaryView view: UICollectionReusableView,
                forElementOfKind elementKind: String,
                at indexPath: IndexPath)

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                canPerformAction action: Selector,
                forItemAt indexPath: IndexPath,
                withSender sender: Any?) -> Bool

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                performAction action: Selector,
                forItemAt indexPath: IndexPath,
                withSender sender: Any?)

  @available(iOS 7.0, *)
  func gridView(_ gridView: UICollectionView,
                transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout

  @available(iOS 9.0, *)
  func gridView(_ gridView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool

  @available(iOS 9.0, *)
  func gridView(_ gridView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool

  @available(iOS 9.0, *)
  func gridView(_ gridView: UICollectionView,
                didUpdateFocusIn context: UICollectionViewFocusUpdateContext,
                with coordinator: UIFocusAnimationCoordinator)
}

extension MGGridDelegate {

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                shouldHighlightItemAt indexPath: IndexPath) -> Bool { return true }

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {}

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {}

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool { return true }

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool { return true }

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {}

  @available(iOS 8.0, *)
  func gridView(_ gridView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {}

  @available(iOS 8.0, *)
  func gridView(_ gridView: UICollectionView,
                willDisplaySupplementaryView view: UICollectionReusableView,
                forElementKind elementKind: String,
                at indexPath: IndexPath) {}

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                didEndDisplaying cell: UICollectionViewCell,
                forItemAt indexPath: IndexPath) {}

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                didEndDisplayingSupplementaryView view: UICollectionReusableView,
                forElementOfKind elementKind: String,
                at indexPath: IndexPath) {}

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool { return false }

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                canPerformAction action: Selector,
                forItemAt indexPath: IndexPath,
                withSender sender: Any?) -> Bool { return false }

  @available(iOS 6.0, *)
  func gridView(_ gridView: UICollectionView,
                performAction action: Selector,
                forItemAt indexPath: IndexPath,
                withSender sender: Any?) {}

  @available(iOS 7.0, *)
  func gridView(_ gridView: UICollectionView,
                transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
    return UICollectionViewTransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
  }

  @available(iOS 9.0, *)
  func gridView(_ gridView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
    return gridView.allowsSelection
  }

  @available(iOS 9.0, *)
  func gridView(_ gridView: UICollectionView,
                shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool { return true }

  @available(iOS 9.0, *)
  func gridView(_ gridView: UICollectionView,
                didUpdateFocusIn context: UICollectionViewFocusUpdateContext,
                with coordinator: UIFocusAnimationCoordinator) {}
}
