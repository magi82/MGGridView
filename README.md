# MGGridView

![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![Platform](https://img.shields.io/cocoapods/p/MGGridView.svg?style=flat)](http://cocoapods.org/pods/MGGridView)
[![Version](https://img.shields.io/cocoapods/v/MGGridView.svg?style=flat)](http://cocoapods.org/pods/MGGridView)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/MGGridView.svg?style=flat)](http://cocoapods.org/pods/MGGridView)

MGGridView 는 콜렉션뷰의 조합으로 만들어진 그리드 뷰입니다.<br>
애플 콜렉션뷰 스타일로 간단하고 쉽게 구현이 가능합니다. :sunny:

몇가지 이유로 뷰는 스토리보드에서 지원하지 않습니다.<br>
하지만 컬렉션뷰셀은 프로그램적으로 구현하거나 xib로 구현할수 있습니다.

## Sample

<img src="https://github.com/magi82/MGStarRatingView/blob/master/Resources/sample.gif?raw=true" width="240">


## Usage
- MGGridView와 데이터소스에 필요한 데이터를 선언합니다.

```swift
let gridView: MGGridView? = nil
let menus: [[String]] = [
	["1-1", "1-2", "1-3"],
	["2-1", "2-2", "2-3", "2-4", "2-5"],
	["3-1", "3-2", "3-3"],
	["4-1", "4-2", "4-3", "4-4", "4-5", "4-6"],
	["5-1", "5-2"]
]
```

- MGGridView를 생성하고 속성을 설정합니다.

```swift
gridView = MGGridView(frame: UIScreen.main.bounds,
			collectionViewLayout: UICollectionViewFlowLayout())
gridView.register(MGGridViewCell.self,
			forCellWithReuseIdentifier: "row")
gridView.configure(delegate: self)
self.view.addSubview(starView)
```

- MGGridView의 데이터소스와 델리게이트를 구현합니다.<br>
  콜렉션뷰와 똑같이 구현하면 됩니다.
- **중요!!!!** 여기 중요한 내용이 있습니다.<br>
  그리드뷰의 column을 위한 설정을 해야 합니다.
  
```swift
// 델리게이트와 데이터소스 구현
extension ViewController: MGGridDelegate, MGGridDataSource {
  func gridView(_ gridView: UICollectionView,
                cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = gridView.dequeueReusableCell(withReuseIdentifier: "row",
                                            for: indexPath) as! MGGridViewCell
    
    // 중요!! column을 위한 설정을 해야 합니다.
    cell.configure { view, layout in
      layout.scrollDirection = .horizontal
      
      view.showsHorizontalScrollIndicator = false
      view.showsVerticalScrollIndicator = false
      view.register(UICollectionViewCell.self,
                    forCellWithReuseIdentifier: "column")
    }
    
    return cell
  }

  func gridView(_ gridView: UICollectionView,
                numberOfItemsInSection section: Int) -> Int {
    return menus.count
  }
}
```

- 필요하다면 Layout 델리게이트도 구현합니다.

```swift
// 레이아웃 델리게이트 구현
extension ViewController: MGGridDelegateFlowLayout {
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width * 0.8, height: 100)
  }
}
```

- MGGridView의 column cell에 대한 델리게이트를 구현합니다.
- **중요!!!!** 여기 중요한 내용이 있습니다.<br>
  델리게이트 구현시 collectionView.tag는 해당 그리드뷰의 레코드 인덱스 입니다.

```swift
// Column에 대한 델리게이트 구현
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    // tag는 그리드뷰의 레코드 인덱스 입니다.
    return menus[collectionView.tag].count
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "column",
                                                  for: indexPath)
    cell.backgroundColor = .brown
    return cell
  }
}
```

- 마찬가지로 필요시 Layout 델리게이트도 구현하면 됩니다.

```swift
extension ViewController: UICollectionViewDelegateFlowLayout {
}
```

## Aid

- [tiny2n](https://github.com/tiny2n)

## Requirements

- Swift 3.0+
- Xcode 8.0+
- iOS 8.0+

## Installation

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

```ruby
pod 'MGGridView', '~> 0.1.0'
```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

```ruby
github "magi82/MGGridView ~> 0.1.0"
```

## Author

magi82, bkhwang82@gmail.com

## License

** MGGridView** is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
