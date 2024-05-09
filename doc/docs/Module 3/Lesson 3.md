---
title: Lesson 3 - Nested Resources
sidebar_position: 3
---

Although those collections from the previous lesson might be empty now, that's fine.

You understand why we have created them. Right? Now we will understand how we can add same type of NFTs to a collection, for that we will delve into a new concept called "nested resources" means resource owning other resource.

This code snippet shows how nested resources make organization possible:

```jsx
// Our Collection with a built-in backpack!
access(all) resource Collection {

    // This is like the backpack that holds all the cool stuff (NFTs)
    access(all) var ownedNFTs: @{UInt64: NFT}

    // This function creates an empty backpack when a new Collection is made
    init() {
        // Assigning an empty dictionary to ownedNFTs
        self.ownedNFTs <- {}
    }
}
```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Remember Module 2 L8 how we have created resource dictionary.
   Similarly create `ownedKnight` and store it to an previously created resource collection.

### Solution !!
