---
title: Lesson 2 - Import
sidebar_position: 2
---

When you want to use outside files you import one file into another, Cadence uses the import keyword which borrow pre-written code or existing projects' code (like NBA Top Shot) to make your work faster!

```jsx
// Import the type `Counter` from a local file.
import Counter from "./examples/counter.cdc"

// Import the type `Counter` from an external account.
import NBATopShot from 0x299F20A29311B9248F12

// Importing `Counter` and NBATopShot into HelloWorld contract.
access(all) contract HelloWorld: Counter, NBATopShot{

}
```

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Let's go back to our Knight contract and try to import a `NonFungibleToken`.

### Solution !!
