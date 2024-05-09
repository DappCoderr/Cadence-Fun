---
title: Lesson 5 - Deposit Function
sidebar_position: 5
---

In the last lesson, we learned how to use the withdraw function, like a super-secure key, to take NFTs out of your collection. But what if you find a new NFT you want to add?

That's where the deposit function comes in, like a special entrance to your collection!

### Let's Peek at the Code!

Let's take a look and understand how to create withdraw function

```jsx
// Our trusty vault (collection) with a special entrance (deposit function)
access(all) resource Collection {

  // This function is like the entrance for new treasures (NFTs)
  access(all) fun deposit(token: @NFT) {

    // Let's get the ID of the NFT you want to deposit
    let tokenID = token.id

    // Add the new NFT to your collection's dictionary.
    self.ownedNFTs[tokenID] <-! token
  }
}
```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Add the deposit function to the Collection resource.

### Solution !!

![Alt text](image-7.png)
