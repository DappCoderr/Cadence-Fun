---
title: Lesson 7 - The Power of Interfaces
sidebar_position: 7
---

So far, you've learned some amazing tools to manage your NFT collection. Now we will take a look of something new element interface. Think interface as a blueprint that defines a set of functions that a specific type of resource (like a collection) must implement. This blueprint acts like a contract, ensuring all resources based on that interface will have the same essential tools available. It's similar to a blueprint for building different types of houses – they might have different layouts, but they all need basic features like doors and windows.

Here's a simplified look at how interfaces are declared and used in Cadence code:

```jsx
// Interface definition (blueprint)
access(all) interface CollectionPublic {
  pub fun deposit(token: @NFT)  // Add an NFT
  pub fun getIDs(): [UInt64]    // Get all NFT IDs
}

// Specific resource (KnightCollection) using the interface
pub resource KnightCollection: CollectionPublic {
  // ...[KnightCollection code implementing deposit and getIDs functions]...
}

```

### **Explanation:**

- We define an interface called CollectionPublic. This is the blueprint that specifies the functionalities a collection must have.
- The CollectionPublic interface has two functions:
  1. deposit: This function allows users to add an NFT to the collection.
  2. getIDs: This function helps users retrieve a list of IDs for all the NFTs stored in the collection.
- Later in the code, we see a specific resource called KnightCollection. This collection implements the CollectionPublic interface. This means the KnightCollection resource must have its own versions of the deposit and getIDs functions defined in its code.

### **Put it to the Test:**
