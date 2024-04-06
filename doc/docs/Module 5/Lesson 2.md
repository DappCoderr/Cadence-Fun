---
title: Lesson 2 - Import in Cadence
sidebar_position: 2
---

Think of the `import` keyword as borrowing tools from a neighbor's toolbox. It allows you to bring code from other files or blockchain contracts into your own smart contracts, making development more efficient. It's a bit like saying, "Hey, I need this piece of code to do something cool."

### **Purpose and Usefulness:**

Think of `import` as a shortcut for developers. It helps in three main ways:

- You can reuse code others have already written. It's like borrowing a recipe instead of inventing one from scratch. Saves time and effort!
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

- In this example, we demonstrate two methods of importing the `Counter` smart contract: from a local file and from an external account.
- By importing, we gain access to all the features of the imported contract without needing to start from scratch.

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Let's go back to our Knight contract and try to import a `NonFungibleToken`.
