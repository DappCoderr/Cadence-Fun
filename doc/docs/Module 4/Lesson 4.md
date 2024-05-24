---
title: Lesson 4 - Update NFT Resource
sidebar_position: 4
---

Update NFT Resource

```jsx
import NonFungibleToken

access(all) contract HelloWorld: NonFungibleToken {

    access(all) resource NFT: NonFungibleToken.NFT {
        init() {}
    }
}
```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. import NonFungibleToken standard into our contract
