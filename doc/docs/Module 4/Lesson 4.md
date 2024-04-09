---
title: Lesson 4 - Take Back - Withdraw Function
sidebar_position: 4
---

Imagine your amazing NFT collection as a giant vault filled with unique digital items. But what if you want to take a special piece out for a closer look, trade it with a friend, or sell it? That's where the withdraw function comes in!

It provide you Flexibility and Security like only authorized users (like you, the owner of the vault) can access it. This keeps your precious NFTs safe from unauthorized withdrawals.

### **Implementation:**

Let's take a look and understand how to create withdraw function

```jsx
// resource declaration
pub resource Collection {

  // function declaration
  pub fun withdraw(withdrawID: UInt64): @NFT {
    // Let's find the NFT you want to take (based on its ID)
    let token <- self.ownedNFTs.remove(key: withdrawID)

    // Uh oh, the NFT wasn't found! Let the user know.
    ?? panic("Token not in collection")

    // If all goes well, return the NFT you grabbed!
    return <- token
  }
}
```

### **Explanation:**

The withdraw function takes a special code (withdrawID) that identifies the exact NFT you want to take out.
Inside the function, we use a magical tool called remove to grab the NFT with the matching ID from your collection (stored in ownedNFTs).
If the NFT is found, it's yours! The function happily returns it to you.
But what if the NFT isn't there? The function throws a little tantrum (indicated by ?? panic) with an error message, letting you know something went wrong.

### **Put it to the Test:**

In this section, learners can practice using the `withdraw` function by:

- Calling the function with different `withdrawID` values to remove NFTs from the collection.
- Checking that the withdrawn NFTs are transferred to the caller successfully.
- Testing scenarios where the provided `withdrawID` does not correspond to any NFT in the collection to understand error handling.
