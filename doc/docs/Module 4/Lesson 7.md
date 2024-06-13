---
title: Lesson 7 - Borrow Function
sidebar_position: 7
---

Imagine a world where your Flow NFT collection is like a bustling library! Users can now "borrow" your awesome NFTs with the brand new borrowNFT function. This lets them get a closer look or interact with your NFTs temporarily, just like checking out a book. Here's how it works:

```jsx
access(all) view fun borrowNFT(_ id: UInt64): &NonFungibleToken.NFT {
    // Use your `ownedNFTs dictionary to look up the NFT associated with the provided ID
    // return a reference to the NFT, allowing users to borrow it temporarily
    // if the NFT with the provided ID doesn't exist in the collection, the function returns `nil`.
    return (&self.ownedNFTs[id] as &NonFungibleToken.NFT?)!
}
```

### Put It to the Test

### Solution !!

![Alt text](image-6.png)
