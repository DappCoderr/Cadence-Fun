---
title: Lesson 8 - Interface
sidebar_position: 8
---

In this lesson, we're introducing an interface called `KnightCollectionPublic`. An interface defines a set of functions that a type must implement. This interface specifies the functions that a `Knight` collection must provide to interact with NFTs.

### **Purpose and Usefulness:**

Interfaces define a contract that concrete types must adhere to. This is useful because:

1. **Standardization:** Interfaces provide a standardized way to interact with different types, ensuring consistency and compatibility across implementations.

2. **Abstraction:** Interfaces allow developers to work with types at a higher level of abstraction, focusing on what actions they can perform rather than their specific implementations.

### **Implementation:**

```jsx
access(all) contract FooBar {

    // ...[previous code]...

    pub resource interface CollectionPublic {
        pub fun deposit(token: @NFT)
        pub fun getIDs(): [UInt64]
    }

    pub resource Collection: CollectionPublic {
        // ...[Collection code]...
    }

    // ...[following code]...
}

```

### **Explanation:**

The `KnightCollectionPublic` interface defines four functions that a `Knight` collection must provide:

- `deposit`: Adds an NFT to the collection.
- `getIDs`: Retrieves the IDs of all NFTs in the collection.
- `borrowNFT`: Allows borrowing an NFT from the collection.
- `borrowKinght`: Allows borrowing a `Knight` NFT from the collection. The post-condition ensures that the returned reference has the correct ID.

### **Put it to the Test:**

In this section, learners can practice using the `KnightCollectionPublic` interface by:

- Implementing a concrete type that adheres to the interface's requirements.
- Ensuring that the implemented functions fulfill the interface's contract.
- Testing the implemented type with various interactions to verify compliance with the interface.
  These exercises help learners understand how interfaces define contracts and guide the implementation of types to meet those requirements.
