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
