---
title: Lesson 8 - Refactoring Create Knight
sidebar_position: 8
---

let's refactor

```jsx
    event KinigtMinted(id:nftId, name:name, type:type)
```

```jsx
pub fun mintKnight(name:String, _value:UInt8): @NFT{
    let nftId = Knight.totalSupply
    var newNFT <- create NFT(_name:name, _type:_value)
    emit KinigtMinted(id:nftId, name:name, type:type)
    return <- newNFT
}
```

### **Explanation:**

### **Putting it to the Test:**
