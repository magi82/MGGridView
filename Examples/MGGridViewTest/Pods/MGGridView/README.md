# MGGridView

![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![Platform](https://img.shields.io/cocoapods/p/MGGridView.svg?style=flat)](http://cocoapods.org/pods/MGGridView)
[![Version](https://img.shields.io/cocoapods/v/MGGridView.svg?style=flat)](http://cocoapods.org/pods/MGGridView)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/MGGridView.svg?style=flat)](http://cocoapods.org/pods/MGGridView)

MGGridView is a grid view created by a combination of collection views.<br>
Apple's collection view method is simple and easy to implement. :sunny:

MGGridView can be created in the storyboard.<br>
In Carthage, however, it is programmatically only.<br>
[Carthage Issues #763](https://github.com/Carthage/Carthage/issues/763)

The column cell does not support registration in the storyboard.<br>
You can implement it programmatically or with xib.

## Sample

<img src="https://github.com/magi82/MGGridView/blob/master/Resources/sample.gif?raw=true" width="240">


## Usage
- Declare the MGGridView, and add the data to the data source.

```swift
var gridView: MGGridView? = nil
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
```

- Create an MGGridView and configure.

```swift
gridView = MGGridView(frame: UIScreen.main.bounds,
                      collectionViewLayout: UICollectionViewFlowLayout())
if let grid = gridView {
  grid.backgroundColor = .white
  grid.register(MGGridViewCell.self,
                    forCellWithReuseIdentifier: "row")
  grid.configure(delegate: self)
  self.view.addSubview(grid)
}
```

- Implement a data source and delegate for MGGridView.<br>
  You can do the same as the collection view.
- **Important!!!!** Here's what's important.<br>
  You need to config for the column in the grid view.
  
```swift
// Implementing delegate and data source
extension ViewController: MGGridViewDelegate, MGGridViewDataSource {
  func gridView(_ gridView: UICollectionView,
                cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = gridView.dequeueReusableCell(withReuseIdentifier: "row",
                                            for: indexPath) as! MGGridViewCell
    
    // Important!! You need to configure for column.
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

- If necessary, also implement a Layout delegate.

```swift
// Row layout delegate implementation
extension ViewController: MGGridViewDelegateFlowLayout {
  func gridView(_ gridView: UICollectionView,
                layout gridViewLayout: UICollectionViewLayout,
                sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 100)
  }
}
```

- Implements a delegate for the column cell of MGGridView.
- **Important!!!!** Here's what's important.<br>
  In a delegate implementation, collectionView.tag is the row index of the corresponding grid view.

```swift
// Delegate implementation for column
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    // Tag is the row index of the grid view.
    return menus[collectionView.tag].count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "column",
                                                  for: indexPath) as! ColumnCollectionViewCell
    
    cell.title.text = menus[collectionView.tag][indexPath.row]
    return cell
  }
}
```

- You can also implement the Layout delegate as needed.

```swift
// Row layout delegate implementation
extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 80, height: 80)
  }
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
pod 'MGGridView', '~> 0.1.1'
```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

```ruby
github "magi82/MGGridView ~> 0.1.1"
```

## Author

magi82, bkhwang82@gmail.com

## License

**MGGridView** is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
