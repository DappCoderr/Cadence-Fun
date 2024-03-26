---
title: Lesson 2 - Import in Cadence
sidebar_position: 2
---

`import` keyword is like borrowing a tool from your neighbor's toolbox when you need it. It lets you bring in code from other files or contracts on the blockchain so you can use it in your own smart contracts. It's a bit like saying, "Hey, I need this piece of code to do something cool - can I borrow it?"

### **Purpose and Usefulness:**

Think of `import` as a shortcut for developers. It helps in three main ways:

- You can reuse code others have already written. It's like borrowing a recipe instead of inventing one from scratch. Saves time and effort!
- You can import and work with other smart contracts. It's like asking a friend to help you with their expertise. Makes building complex stuff easier!
- Importing from trusted sources boosts security. It's like buying ingredients from a reliable store. Reduces risks and headaches!

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

In this example, we're importing the `NonFungibleToken` contract from the address `0xft22if84jkj42mw0`. It's like borrowing a special tool for handling non-fungible tokens (unique digital items). By importing, we can use all the features of `NonFungibleToken` without starting from scratch.

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Let's go back to our contract and try to import a `NonFungibleToken` from `0x299F20A29311B9248F12`
