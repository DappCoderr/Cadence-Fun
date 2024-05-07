---
title: Lesson 7 - The Interfaces
sidebar_position: 7
---

congrats for making this far. Wooh!!

You remember all those awesome functions you learned to manage your NFT collection? Now we're about to take things a step further with interfaces.

Interface is a blueprint of the collection, it let it know which functions are publicly available.

```jsx
// Interface definition (blueprint)
access(all) interface CollectionPublic {
  pub fun deposit(token: @NFT)  // Add an NFT
  pub fun getIDs(): [UInt64]    // Get all NFT IDs
}

// Specific resource (KnightCollection) using the interface
pub resource KnightCollection: CollectionPublic {
  // ...[KnightCollection code implementing deposit and getIDs functions]...
}

```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Remember Module 2 L8 how we have created resource dictionary.
   Similarly create `ownedKnight` and store it to an previously created resource collection.

### Solution !!
