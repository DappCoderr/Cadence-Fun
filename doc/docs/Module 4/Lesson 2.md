---
title: Lesson 2 - Collection
sidebar_position: 2
---

In this lesson, we're introducing a new concept called `Collections`.

A collection acts as a special container that holds multiple non-fungible tokens (NFTs) together. It allows us to organize and manage our NFTs more efficiently, akin to organizing items in different folders on your computer.

Storing individual NFTs directly in an account's storage can cause issues, especially if you want to store multiple NFTs. Instead, it's required to create a collection that can hold multiple NFTs. This collection can then be stored in the account's storage.

### Purpose and Usefulness

Collections help us organize and manage our NFTs in a structured way. This is useful because:

- Grouping NFTs into collections makes it easier to keep track of them and perform actions on them collectively.
- Collections can have special features or behaviors tailored to specific use cases. For example, a game might have collections for different types of in-game items, each with its own rules and interactions.

### Implementation

```jsx
import NonFungibleToken from 0xft22if84jkj42mw0

access(all) contract HelloWorld: NonFungibleToken {

    access(all) resource Collection {
    }
}
```

### Explanation

This code adds a new resource type called `Collection` within the HelloWorld contract. It acts as a container for non-fungible tokens (NFTs) and enables collective operations.

`ownedNFTs`: This variable stores the NFTs owned by the contract.

`init()`: Initializes the ownedNFTs collection as empty when a Collection instance is created.

`destroy()`: Cleans up the ownedNFTs collection when the Collection instance is destroyed.

### Try it Out

1. Open Flow [Playground](https://play.flow.com/)
2. Creating new resource named as `Collection`.

- Adding NFTs to collections and removing them.
- Performing actions on all NFTs within a collection, such as transferring ownership or updating properties.
  These exercises help learners understand how collections work and how they can be used to manage NFTs effectively in their contracts.
