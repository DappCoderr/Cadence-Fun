---
title: Lesson 4 - Introducing Collection
sidebar_position: 4
---

In this lesson, we're introducing a concept called `Collection`. A collection is like a special container that holds multiple non-fungible tokens (NFTs) together. It allows us to organize and manage our NFTs more efficiently, just like organizing items in different folders on your computer.

### **Purpose and Usefulness:**

Collections help us organize and manage our NFTs in a structured way. This is useful because:

- Grouping NFTs into collections makes it easier to keep track of them and perform actions on them collectively.
- Collections can have special features or behaviors tailored to specific use cases. For example, a game might have collections for different types of in-game items, each with its own rules and interactions.

### **Implementation:**

```jsx
import NonFungibleToken from 0xft22if84jkj42mw0

access(all) contract HelloWorld: NonFungibleToken {

    access(all) resource NFT {
        // Some code...
    }

    access(all) resource Collection: NonFungibleToken.Collection {
        // Some code...
    }
}
```

### **Explanation:**

Inside the `HelloWorld` contract, we've introduced two resources: `NFT` and `Collection`. While we've defined `NFT` before, `Collection` is a new resource type provided by the `NonFungibleToken` contract. It represents a collection of NFTs and allows us to perform operations on them collectively.

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Creating new resource named as `Collection`.

- Adding NFTs to collections and removing them.
- Performing actions on all NFTs within a collection, such as transferring ownership or updating properties.
  These exercises help learners understand how collections work and how they can be used to manage NFTs effectively in their contracts.
