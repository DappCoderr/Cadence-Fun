---
title: Lesson 6 - Counting Your Treasures!
sidebar_position: 6
---

Previously we have learn about collection, withdraw function and deposit function. Right? And you know your NFT collection as a giant treasure chest, imagine it's overflowing with unique digital goodies. Just like a library full of books, it can be difficult to keep track of how many items you have without counting them. Right?

So we have one more interesting function which is like a magical counter for your collection. It dives inside and counts the number of unique NFTs you've stored

### **Implementation:**

Let's take a look and understand how to create getId function.

```jsx
// Our trusty treasure chest (collection) with a special counting tool (getId function)
pub resource Collection {

  // This function acts like a magic counter for your treasures (NFTs)!
  pub fun getIDs(): [UInt64] {
    // Look inside your collection's storage (dictionary) and count the keys (NFT IDs)
    return self.ownedNFTs.keys
  }
}
```

### **Explanation:**

The getId function doesn't actually return the number of NFTs, but something just as useful – a list of all the IDs (unique codes) of the NFTs stored in your collection.
Remember your collection's storage (represented by ownedNFTs) is like a box with labeled shelves (IDs) for each NFT. The getId function simply counts all the labels (IDs) and gives you a list.

### **Put it to the Test:**
