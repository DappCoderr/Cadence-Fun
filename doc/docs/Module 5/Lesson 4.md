---
title: Lesson 4 - Refactoring Collection
sidebar_position: 4
---

Till now we have we have learned about how to resources, create contract storage and saving NFT to the contract storage.

Before moving forward, we will understand flow accounts. In Cadence, users can store & own their data. This is very different from other languages like Solidity on Ethereum, where your NFT gets stored in the smart contract. In Cadence, if I own an NFT, it gets stored in my account. By moving forward we will store our Knight directly into our own account rather than storing in smart contract.

### **Implementation:**

Let's take a look how we can implement this -

```jsx
// Import the type `Counter` from a local file.
//
import Counter from "./examples/counter.cdc"

// Import the type `Counter` from an external account.
//
import Counter from 0x299F20A29311B9248F12

```

### **Explanation:**

- In this example, we demonstrate two methods of importing the `Counter` smart contract: from a local file and from an external account.
- By importing, we gain access to all the features of the imported contract without needing to start from scratch.

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Let's go back to our Knight contract and try to import a `NonFungibleToken`.
