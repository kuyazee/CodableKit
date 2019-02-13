# CodableKit

[![LinkedIn](https://img.shields.io/badge/LinkedIn-zjgpesquera-blue.svg)](https://www.linkedin.com/in/zjgpesquera/)
[![Github](https://img.shields.io/badge/Github-kuyazee-blue.svg)](https://github.com/kuyazee)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-supported-red.svg)](http://cocoapods.org)

__CodableKit__ is available through the dependency manager [CocoaPods](http://cocoapods.org).

===================

__CodableKit__ is a library built to extend Swift's __Codable__.

## Installation

To install the CodableKit via cocoapods, simply use the add this in your podfile and then run `pod install`

```Cocoapods
pod 'Codable-Kit'
```

## Usage

### JSON Decoding

Without Type Inference

```
let decoder = JSONDecoder()
do {
    let user = try decoder.decode(User.self, from: userData)
} catch {
    print(error)
}
```

With Type Inference

```
let decoder = FileDecoder(decoder: JSONDecoder(), bundle: .main, fileManager: .default)
do {
    let user: User = try decoder.decode(userData)
} catch {
    print(error)
}
```


### File Decoding

Without Type Inference

```
let decoder = FileDecoder(decoder: JSONDecoder(), bundle: .main, fileManager: .default)
do {
    let user = try decoder.decode(User.self, from: File(name: "user", type: "json"))
} catch {
    print(error)
}
```

With Type Inference

```
let decoder = FileDecoder(decoder: JSONDecoder(), bundle: .main, fileManager: .default)
do {
    let user: User = try decoder.decode(File(name: "user", type: "json"))
} catch {
    print(error)
}
```


### Custom Decoders

## TODO

- CodableKit/[Result](https://github.com/antitypical/Result)
- CodableKit/[XMLParsing](https://github.com/ShawnMoore/XMLParsing)

## References

- [John Sundell](https://www.swiftbysundell.com)'s [article](https://www.swiftbysundell.com/posts/type-inference-powered-serialization-in-swift).
