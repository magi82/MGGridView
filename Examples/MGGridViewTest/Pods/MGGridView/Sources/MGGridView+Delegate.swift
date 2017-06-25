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

public protocol MGGridViewDelegate: NSObjectProtocol {
  
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

extension MGGridViewDelegate {
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                       shouldHighlightItemAt indexPath: IndexPath) -> Bool { return true }
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {}
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {}
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool { return true }
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool { return true }
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {}
  
  @available(iOS 8.0, *)
  public func gridView(_ gridView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {}
  
  @available(iOS 8.0, *)
  public func gridView(_ gridView: UICollectionView,
                       willDisplaySupplementaryView view: UICollectionReusableView,
                       forElementKind elementKind: String,
                       at indexPath: IndexPath) {}
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                       didEndDisplaying cell: UICollectionViewCell,
                       forItemAt indexPath: IndexPath) {}
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                       didEndDisplayingSupplementaryView view: UICollectionReusableView,
                       forElementOfKind elementKind: String,
                       at indexPath: IndexPath) {}
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool { return false }
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                       canPerformAction action: Selector,
                       forItemAt indexPath: IndexPath,
                       withSender sender: Any?) -> Bool { return false }
  
  @available(iOS 6.0, *)
  public func gridView(_ gridView: UICollectionView,
                       performAction action: Selector,
                       forItemAt indexPath: IndexPath,
                       withSender sender: Any?) {}
  
  @available(iOS 7.0, *)
  public func gridView(_ gridView: UICollectionView,
                       transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                       newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
    return UICollectionViewTransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
  }
  
  @available(iOS 9.0, *)
  public func gridView(_ gridView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
    return gridView.allowsSelection
  }
  
  @available(iOS 9.0, *)
  public func gridView(_ gridView: UICollectionView,
                       shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool { return true }
  
  @available(iOS 9.0, *)
  public func gridView(_ gridView: UICollectionView,
                       didUpdateFocusIn context: UICollectionViewFocusUpdateContext,
                       with coordinator: UIFocusAnimationCoordinator) {}
}
