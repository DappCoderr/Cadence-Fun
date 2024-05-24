---
title: Lesson 4 - The Secret Sauce
sidebar_position: 4
---

Let's take a look at the [Flow NFT standard](https://developers.flow.com/build/core-contracts/non-fungible-token)

Think a standard like a Legos! Just like Legos snap together seamlessly, the Flow NFT Standard ensures all NFTs are built the same way. NFTs built with the same standard can be easily bought, sold, and transferred between different dapps or marketplaces in the Flow world.

Let's take a look how we can use Standard into your contract.

```jsx
import NonFungibleToken

// use the NonFungibleToken to make sure this contract follow the Flow NFT standard
access(all) contract HelloWorld: NonFungibleToken {

}
```

**Updating NFT Resource:**
The NFT resource must implement the NonFungibleToken.INFT interface:

```jsx
import NonFungibleToken

access(all) contract HelloWorld: NonFungibleToken {

    access(all) resource NFT: NonFungibleToken.NFT {
        init() {}
    }
}
```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. import NonFungibleToken standard into our contract
