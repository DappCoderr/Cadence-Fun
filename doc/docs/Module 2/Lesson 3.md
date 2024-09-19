---
title: Lesson 3 - Constants & Variables
sidebar_position: 3
---

Storing Information in Your Contracts:

Variables in Cadence act like storage boxes on the blockchain, holding information similar to how a database stores data. In Cadence, we use two main keywords:

1. `var` for variables that are initialized with a value and can be reassigned later.
2. `let` for constants that are initialized with a value and cannot be reassigned afterwards.

Let's see this in action with a HelloWorld contract:

```jsx
access(all) contract HelloWorld {
  // Changeable variable (using 'var')
  access(all) var country: String
  // Constant (using 'let')
  access(all) let population: UInt64

  init() {
    self.country = "India"
    self.population = 10
  }
}
```

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a public variables, `totalKnight` of type `UInt64`, initialized with `0`.

### Solution !!

![Alt text](image-1.png)
