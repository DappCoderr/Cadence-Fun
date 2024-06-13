---
title: Lesson 5 - Adding Standard Events
sidebar_position: 5
---

Are you getting some error? Don't worry we will resolve them now.

Imagine a world where your Flow NFT collection is like a bustling library! Users can now "borrow" your awesome NFTs with the brand new borrowNFT function. This lets them get a closer look or interact with your NFTs temporarily, just like checking out a book. Here's how it works:

```jsx
import NonFungibleToken from 0x1d7e57aa55817448

access(all) contract FooBar: NonFungibleToken {
    access(all) var totalSupply: UInt64
    access(all) event ContractInitialized()
    access(all) event Withdraw(id: UInt64, from: Address?)
    access(all) event Deposit(id: UInt64, to: Address?)

    init() {
        self.totalSupply = 0
        emit ContractInitialized()
    }
}
```

### Put It to the Test

### Solution !!

![Alt text](image-4.png)
