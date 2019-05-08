# UIColourPicker
A simple RGB colour picker for IOS

The project UIColourPicker can be used to build the framework.
Import the framework into  your project and it can be used in your view controller like this

```
    let cp = UIColourPickerAlert()
    cp.delegate = self
    cp.setColourString(colour: view.backgroundColor!.toHexString())
    present(cp, animated: true, completion: nil)
```

The project example is a simple app where the colour picker can be invoked and the background colour of the calling view is changed to the selected one.

![landscape image](https://github.com/jameschip/UIColourPicker/blob/master/screenshots/landscape.png?raw=true)
![portrait image](https://github.com/jameschip/UIColourPicker/blob/master/screenshots/portrait.png?raw=true)
