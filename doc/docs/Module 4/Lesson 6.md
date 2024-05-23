---
title: Lesson 7 - Refactoring Create Knight
sidebar_position: 7
---

let's refactor

```cadence
pub fun mintKnight(name:String, _value:UInt8): @NFT{
        let nftId = Knight.totalSupply
        var newNFT <- create NFT(_name:name, _type:_value)
        emit KinigtMinted(id:nftId, name:name, type:type)
        return <- newNFT
    }
```

### **Explanation:**

### **Putting it to the Test:**
