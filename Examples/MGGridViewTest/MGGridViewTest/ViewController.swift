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

import MGGridView

class ViewController: UIViewController {

  @IBOutlet var gridView: MGGridView? = nil
  let menus: [[String]] = [
    ["1-1", "1-2", "1-3", "1-4", "1-5", "1-6", "1-7", "1-8", "1-9", "1-10"],
    ["2-1", "2-2", "2-3", "2-4", "2-5", "2-6", "2-7", "2-8", "2-9", "2-10"],
    ["3-1", "3-2", "3-3", "3-4", "3-5", "3-6", "3-7", "3-8", "3-9", "3-10"],
    ["4-1", "4-2", "4-3", "4-4", "4-5", "4-6", "4-7", "4-8", "4-9", "4-10"],
    ["5-1", "5-2", "5-3", "5-4", "5-5", "5-6", "5-7", "5-8", "5-9", "5-10"],
    ["6-1", "6-2", "6-3", "6-4", "6-5", "6-6", "6-7", "6-8", "6-9", "6-10"],
    ["7-1", "7-2", "7-3", "7-4", "7-5", "7-6", "7-7", "7-8", "7-9", "7-10"],
    ["8-1", "8-2", "8-3", "8-4", "8-5", "8-6", "8-7", "8-8", "8-9", "8-10"],
    ["9-1", "9-2", "9-3", "9-4", "9-5", "9-6", "9-7", "9-8", "9-9", "9-10"]
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    if let grid = gridView {
      grid.backgroundColor = .white
      grid.register(MGGridViewCell.self,
                        forCellWithReuseIdentifier: "row")
      grid.configure(delegate: self)
      self.view.addSubview(grid)
    }
  }
}

// 델리게이트와 데이터소스 구현
extension ViewController: MGGridViewDelegate, MGGridViewDataSource {
  func gridView(_ gridView: UICollectionView,
                cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = gridView.dequeueReusableCell(withReuseIdentifier: "row",
                                            for: indexPath) as! MGGridViewCell
    
    // 중요!! column을 위한 설정을 해야 합니다.
    cell.configure { view, layout in
      layout.scrollDirection = .horizontal
      
      view.showsHorizontalScrollIndicator = false
      view.showsVerticalScrollIndicator = false
      view.register(UINib(nibName: "ColumnCollectionViewCell", bundle: nil),
                    forCellWithReuseIdentifier: "column")
    }
    
    return cell
  }
  
  func gridView(_ gridView: UICollectionView,
                numberOfItemsInSection section: Int) -> Int {
    return menus.count
  }
}

// row 레이아웃 델리게이트 구현
extension ViewController: MGGridViewDelegateFlowLayout {
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 100)
  }
}

// column에 대한 델리게이트 구현
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    // tag는 그리드뷰의 레코드 인덱스 입니다.
    return menus[collectionView.tag].count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "column",
                                                  for: indexPath) as! ColumnCollectionViewCell
    
    cell.title.text = menus[collectionView.tag][indexPath.row]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    print("row: \(collectionView.tag), column: \(indexPath.row) => value: \(menus[collectionView.tag][indexPath.row])")
  }
}

// row 레이아웃 델리게이트 구현
extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 80, height: 80)
  }
}
