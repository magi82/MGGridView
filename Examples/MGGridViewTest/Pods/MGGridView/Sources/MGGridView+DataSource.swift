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

public protocol MGGridViewDataSource: NSObjectProtocol {
  
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

extension MGGridViewDataSource {
  
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
