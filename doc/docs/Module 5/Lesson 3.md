---
title: Lesson 3 - The Secret Sauce
sidebar_position: 3
---

This lesson dives into the Flow NFT Standard, a set of rules that acts like a blueprint for building digital treasures.

But why do we need standards? Why not just create NFTs without them?

Think of them like Legos! Just like Legos snap together seamlessly, the Flow NFT Standard ensures all NFTs are built the same way. This makes them work smoothly across different games and apps in the Flow world.

The power of standards brings everyone to understands how NFTs work, allowing them to be used in various places. Also NFTs built with the same standard can be easily bought, sold, and transferred between different games or marketplaces.

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
