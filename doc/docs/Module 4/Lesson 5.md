---
title: Lesson 5 - Collection Storage
sidebar_position: 5
---

In this lesson, we're diving deeper into collections by adding storage capabilities. This means we're giving our collections the ability to remember and keep track of the non-fungible tokens (NFTs) they contain. It's like giving a backpack the ability to store items you collect on your journey.

### **Purpose and Usefulness:**

Storage for collections is crucial because:

- Collections need to remember which NFTs they contain, just like a backpack needs to remember the items inside it. Storage allows collections to keep track of their contents over time.
- Storing NFTs within collections makes it easier to access and manage them. It's like having a well-organized backpack where you can quickly find what you need.

### **Implementation:**

```jsx
access(all) resource Collection: NonFungibleToken.Collection {

    access(contract) var ownedNFTs: @{UInt64: HelloWorld.NFT}

    init() {
        self.ownedNFTs <- {}
    }
}
```

### **Explanation:**

Inside the `Collection` resource, we've added a storage variable `ownedNFTs`. This variable is a dictionary that maps `UInt64` keys to instances of `HelloWorld.NFT`. Each key represents a unique identifier for an NFT, and its corresponding value is the NFT itself. In the `init` function, we initialize `ownedNFTs` to an empty dictionary when a new collection is created.

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Adding NFTs to the `ownedNFTs` dictionary.
