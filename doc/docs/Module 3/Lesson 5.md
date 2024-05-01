---
title: Lesson 5 - Fill Your Vault
sidebar_position: 5
---

Remember your awesome collection, like a giant vault filled with unique treasures? In our last lesson we have learned the withdraw function that lets you take things out, but what if you want to add something new? That's where the deposit function comes in!

Think of the deposit function like a special entrance to your vault. It allows anyone to put in a new NFT (like a shiny new sword or a rare monster) to your collection. It's similar to depositing money in a bank – you're adding something valuable to your growing stash.

Let's revisit the vault door (the code) and see how the deposit function works!

```jsx
// Our trusty vault (collection) with a special entrance (deposit function)
pub resource Collection {

  // ...[withdraw function code from previous lesson]...

  // This function is like the entrance for new treasures (NFTs)
  pub fun deposit(token: @NFT) {

    // Let's get the ID of the NFT you want to deposit
    let tokenID = token.id

    // Add the new NFT to your collection's storage (dictionary)
    self.ownedNFTs[tokenID] <-! token
  }

  // ...[following code]...
}
```

### **Explanation:**

The deposit function takes an NFT (token) as an argument. This is the treasure you want to add to your collection.
Inside the function, we grab a special code (tokenID) that identifies the specific NFT.
Then, we use this ID to place the NFT inside your collection's storage (represented by the ownedNFTs dictionary). It's like adding a new item to a shelf with a specific label (ID).
Here's a cool detail: If there already happens to be an NFT with the same ID in your collection, the new one replaces the old one. This keeps things organized and avoids duplicates.

### **Put it to the Test:**
