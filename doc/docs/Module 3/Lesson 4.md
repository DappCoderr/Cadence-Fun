---
title: Lesson 4 - Withdraw Function
sidebar_position: 4
---

Great work, now you have store you Knight NFT into your collection. But what if you want to take a special NFT out for a spin? Maybe you want to show it off to a friend, trade it for something else, or even sell it on a marketplace!

That's where the withdraw function comes in!

Your collection is a giant vault, and the withdraw function is the key that unlocks it. But don't worry, this key is super secure! Only you (the owner) can use it to take things out. This keeps your NFTs safe from unauthorized withdrawals.

### Let's Peek at the Code!

Let's take a look and understand how to create withdraw function

```jsx
// resource declaration
pub resource Collection {

  // function declaration
  pub fun withdraw(withdrawID: UInt64): @NFT {
    // Let's find the NFT you want to take (based on its ID)
    // Then it searches the collection dictionary and pass it to token
    let token <- self.ownedNFTs.remove(key: withdrawID)

    // Uh oh, the NFT wasn't found! Let the user know "Oops, that NFT isn't in your collection!"
    ?? panic("Token not in collection")

    // If all goes well, return the NFT you grabbed!
    return <- token
  }
}
```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Remember Module 2 L8 how we have created resource dictionary.
   Similarly create `ownedKnight` and store it to an previously created resource collection.

### Solution !!
