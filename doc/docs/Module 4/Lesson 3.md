---
title: Lesson 3 - Marking Knight as NFT
sidebar_position: 3
---

In this lesson, we're going to mark a `Knight` as a non-fungible token (NFT). Imagine each `Knight` as a unique character in a game or a special digital collectible. We'll use the `NonFungibleToken` contract we imported earlier to help us manage these special tokens.

### **Purpose and Usefulness:**

Turning the `Knight` into an NFT makes it one-of-a-kind, just like real-life collectibles. This is useful because:

- Each `Knight` will have its own special identity. It's like giving each player in a game their own unique avatar.
- NFTs can be owned, bought, and sold. It's like owning a rare baseball card - you can trade it with others or keep it safe in your collection.

### **Implementation:**

```cadence
import NonFungibleToken from 0xft22if84jkj42mw0

access(all) contract HelloWorld: NonFungibleToken {

    access(all) resource NFT: NonFungibleToken.NFT {
        init() {}
    }
}
```

### **Explanation:**

Inside the `HelloWorld` contract, we've created a resource called `NFT`. Resources in Cadence are special types of objects that represent digital assets, like our `Knight`. By defining `NFT` as a resource, we're saying that each instance of `NFT` will be a unique token.

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Create instances of `NFT` within the `Knight` contract.
3. Add properties to the `NFT` resource to make each Knight unique.
