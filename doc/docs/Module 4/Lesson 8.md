---
title: Lesson 8 - Refactoring Create Knight
sidebar_position: 8
---

let's refactor

```jsx
access(all) event KinigtMinted(id:UInt64)
```

```jsx
access(all) fun createKnight(): @NFT {
    var newNFT <- create NFT()
    emit KinigtMinted(id:self.totalSupply)
    return <- newNFT
}
```

### Put It to the Test

### Solution !!
