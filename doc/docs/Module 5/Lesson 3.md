---
title: Lesson 3 - Introduction to Flow-NFT Standard
sidebar_position: 3
---

In this lesson, we'll explore the Flow NFT Standard, a guideline defining events, functions, resources, and other elements necessary for NFT contracts. Implementing this standard ensures compatibility of your NFTs with various platforms and services within the Flow ecosystem.

### **Purpose and Usefulness:**

1. **Unique Identity:** Transforming resources into NFTs grants them individuality, akin to real-life collectibles. Each NFT, such as a Knight, possesses its own distinct identity, similar to providing players in a game with unique avatars.

2. **Ownership and Exchange:** NFTs can be owned, bought, and sold, resembling ownership of rare physical collectibles like baseball cards. This feature allows for trading among users or safekeeping within personal collections.

### **Implementation:**

To integrate the Flow NFT Standard into your contract, follow these steps:

```jsx
import NonFungibleToken

access(all) contract HelloWorld: NonFungibleToken {

    // ...[rest of code]...

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

### **Explanation:**

Within the HelloWorld contract, we define a resource named NFT. Resources in Cadence represent digital assets, such as our Knight NFTs. By declaring NFT as a resource, each instance signifies a unique token, adhering to the NFT standard.

### **Put it to the Test:**

1. Feel free to experiment with the Flow [Playground](https://play.flow.com/)
2. Create instances of NFTs within the Knight contract.
3. Enhance the NFT resource by adding properties to ensure uniqueness for each Knight.
