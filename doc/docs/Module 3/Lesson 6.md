---
title: Lesson 6 - Counting Your Treasures!
sidebar_position: 6
---

Just like a library full of books, keeping track of everything can get tricky. That's where our new superpower comes in: **getIDs function!**

It dives inside collection and counts all the unique NFTs you've stored in your collection.

### **Implementation:**

Let's take a look and understand how to create getId function.

```jsx
// Our trusty treasure chest (collection) with a special counting tool (getId function)
access(all) resource Collection {

  // This function acts like a magic counter for your treasures (NFTs)!
  access(all) fun getIDs(): [UInt64] {
    // Look inside your collection's storage (dictionary) and count the keys (NFT IDs)
    return self.ownedNFTs.keys
  }
}
```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Add the getIDs function to the Collection resource.

### Solution !!

![Alt text](image-8.png)
