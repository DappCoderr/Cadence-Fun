---
title: Lesson 5 - Upgrading Collection
sidebar_position: 5
---

Building custom NFT collections is exciting, but managing them efficiently can be a challenge. Imagine having built-in superpowers for your collection, allowing users to interact with your NFTs seamlessly. That's the magic of standard interfaces in Flow!

Let's us the potential of `NonFungibleToken.Provider`, `NonFungibleToken.Receiver`, and `NonFungibleToken.CollectionPublic` interfaces. These are like pre-programmed superpowers for your collection, giving it the ability to:

- **Lend out NFTs:** Want users to view an NFT's coolness without permanently removing it? The borrowNFT function grants a read-only peek, like lending out a prized trading card to a friend.
- **Accept new NFTs:** Imagine your collection being a welcoming museum! With NonFungibleToken.Receiver, your collection can gracefully accept new NFTs from other accounts.
- **Speak the standard language:** The NonFungibleToken.CollectionPublic interface makes your collection a part of the Flow NFT community, ensuring smooth interaction with other NFT-savvy applications.

**Let's Code Like a Pro!**

Here's a glimpse of the code that activates these superpowers:

Let's take a look how we can implement this -

```jsx
pub resource Collection: NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic {
    // ...[rest of code]...
}
```

```jsx
pub resource Collection: NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic {

    // Add new borrowNFT function
    // Access a read-only reference to an NFT in the collection without actually removing it

    pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT {
        // Code to lend out an NFT for viewing
    }

    // ...[other collection functions]...
}

```

```jsx
// update the ownedNFTs, deposit, and withdraw functions to use the NonFungibleToken.NFT type
pub var ownedNFTs: @{UInt64: NonFungibleToken.NFT}

pub fun deposit(token: @NonFungibleToken.NFT) {
    //...[deposit code]...
}

pub fun withdraw(withdrawID: UInt64): @NonFungibleToken.NFT {
    //...[withdraw code]...
}

```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Update the collection resource with interface.
3. Add borrowNFT function in the collection resource.
