---
title: Lesson 2 - Import
sidebar_position: 2
---

Building a game? Need a special function? With import, borrow pre-written code (like a magic toolbox) or existing projects' code (like NBA Top Shot) to make your game shine and work faster!

Ready to borrow? Use import to bring in the code you need. Now let's take a look how we can implement this -

```jsx
// Import the type `Counter` from a local file.
//
import Counter from "./examples/counter.cdc"

// Import the type `Counter` from an external account.
//
import Counter from 0x299F20A29311B9248F12

```

### **Explanation:**

In this example, we show two ways to import the Counter smart contract:

- From a local file on your computer.
- From another account on the blockchain (identified by its address).

By using import, you gain access to all the features of the imported contract without writing all that code yourself. It's like having a whole new set of tools at your disposal!

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Let's go back to our Knight contract and try to import a `NonFungibleToken`.
