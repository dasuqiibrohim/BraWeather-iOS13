![dailyCalculator](https://user-images.githubusercontent.com/73922909/112814582-a2322480-90a9-11eb-98e1-3fa1d77127c5.jpg)


# Daily Calculator iOS
A Daily Calculator iOS project created in Swift using AutoLayout, IBDesignable, SubViews, dan Side Menu.

# Getting Started
Daily Calculator contains the implementation of Automatic Layout. Auto Layout makes it easy to support multiple screen sizes in your app. Auto Layout on swift, Make apps look great in any orientation on various devices.

```
if you love this Daily Calculator, give us a star, you will be an encouragement in our lives.
```

# Designer
Contributors names and contact info
* Stephanie Ogbudu
* [Uplabs](https://www.uplabs.com/posts/calculator-app-90e0923d-c26b-4f19-9320-4e716271c868)

# How to Use
### Step 1:

Download or clone this repo by using the link below:

```
https://github.com/dasuqiibrohim/Daily-Calculator-iOS.git
```

### Step 2:

Go to project root and execute the following command in console to get the required dependencies:

```
pod install
```

# Daily Calculator Features
* Stack View

  ![Screen Shot 2021-03-26 at 10 47 1](https://user-images.githubusercontent.com/73922909/112574430-ce874000-8e20-11eb-9085-12329e731039.jpg)

* Shadow
  Use Shadow with setting on Class IBDesignable:
  ```
  extension UIButton {
    open override func awakeFromNib() {
        layer.cornerRadius = 8
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.5
    }
  }
  ```
  ![Simulator Screen Shot - iPhone 8 - 2021-03-26 at 10 28 1](https://user-images.githubusercontent.com/73922909/112573823-a21ef400-8e1f-11eb-9b57-1d30a97cf582.jpg)
  
* Side Menu

  ![Simulator Screen Shot - iPhone 8 - 2021-03-26 at 10 42 1](https://user-images.githubusercontent.com/73922909/112574023-080b7b80-8e20-11eb-8272-2b2825461aac.jpg)

# Libraries & Tools Used
[SideMenu](https://github.com/jonkykong/SideMenu)

# About Us
I am [Ibrohim Dasuqi](https://github.com/dasuqiibrohim) from indonesia is a Software Developer focused on mobile iOS Developers. If you are interested in working with me, you can contact me via [Linkedin](https://www.linkedin.com/in/dasuqiibrohim/).

# Conclusion
This is a Daily Calculator our version, if you liked my work don't forget to give a ⭐ star the repo to show your support. if you want to lend a hand with the Daily Calculator then please feel free to submit an issue and/or pull request. :)
